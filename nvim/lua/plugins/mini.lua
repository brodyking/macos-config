return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 0,
			},
			options = {
				border = "both",
			},
			symbol = "╎",
		})

		require("mini.tabline").setup({
			format = nil,
			tabpage_section = "left",
			show_icons = false,
		})

		require("mini.statusline").setup({
			use_icons = false,
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 0 })
					mode = mode:upper()
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
						"%<",
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl, strings = { location } },
					})
				end,
			},
		})

		-- Highlight overrides matched to the hubbamax palette (from your
		-- lualine theme file).
		--
		-- IMPORTANT: this must run AFTER `colorscheme hubbamax` is applied,
		-- not at plugin-config time. Colorscheme scripts typically do
		-- `:hi clear` before defining their own groups, which would wipe out
		-- any overrides set here if this ran during lazy's config phase
		-- (which happens before `colorscheme` is set in init.lua). Hooking
		-- the ColorScheme event instead makes this survive regardless of
		-- load order, and re-applies automatically if you ever `:colorscheme`
		-- reload.
		local function apply_hubbamax_highlights()
			local palette = require("hubbamax.palette")
			local hubbamax_config = require("hubbamax.config")

			local function get_bg(color)
				return hubbamax_config.options.transparent_background and "NONE" or color
			end

			local function get_fg(normal_fg, bright_fg)
				return hubbamax_config.options.transparent_background and bright_fg or normal_fg
			end

			local function mode_hl(accent)
				return { fg = get_fg(palette.base.bg.gui, accent), bg = get_bg(accent), bold = true }
			end

			-- Statusline: mode-colored section (matches hubbamax.normal/insert/
			-- visual/replace/command/terminal .a colors from your lualine theme)
			vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", mode_hl(palette.base.gray6.gui))
			vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", mode_hl(palette.accent.green.gui))
			vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", mode_hl(palette.accent.purple.gui))
			vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", mode_hl(palette.accent.red.gui))
			vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", mode_hl(palette.accent.yellow_bright.gui))
			vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", mode_hl(palette.accent.cyan.gui)) -- covers Terminal etc.

			-- Statusline: static (non-mode) sections (matches the .b / .c
			-- colors, which are identical across all modes in your lualine theme)
			vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", {
				fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui),
				bg = get_bg(palette.base.gray3.gui),
			})
			vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
				fg = get_fg(palette.base.gray6.gui, palette.base.gray7.gui),
				bg = get_bg(palette.base.gray2.gui),
			})
			vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", {
				fg = get_fg(palette.base.gray8.gui, palette.base.fg.gui),
				bg = get_bg(palette.base.gray3.gui),
			})
		end

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "hubbamax",
			callback = apply_hubbamax_highlights,
		})

		-- Colorscheme may already be active by the time this runs, depending
		-- on load order, so also apply immediately as a safety net.
		if vim.g.colors_name == "hubbamax" then
			apply_hubbamax_highlights()
		end
	end,
}
