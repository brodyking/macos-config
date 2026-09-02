return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		-- Compat shim: telescope's previewer still calls the old
		-- master-branch `nvim-treesitter.parsers.ft_to_lang`, which the
		-- `main` branch doesn't provide. See:
		-- https://github.com/nvim-telescope/telescope.nvim/issues/3547
		local ok, parsers = pcall(require, "nvim-treesitter.parsers")
		if not ok then
			parsers = {}
			package.loaded["nvim-treesitter.parsers"] = parsers
		end
		if parsers.ft_to_lang == nil then
			parsers.ft_to_lang = function(ft)
				return vim.treesitter.language.get_lang(ft) or ft
			end
		end

		require("nvim-treesitter").install({
			"lua",
			"vim",
			"vimdoc",
			"query",
			"python",
			"bash",
			"markdown",
			"markdown_inline",
			"json",
			"yaml",
			"toml",
			"javascript",
			"html",
			"c",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ok = pcall(vim.treesitter.start)
				if not ok then
					return -- no parser for this filetype, skip
				end

				-- treesitter-based indentation (experimental but solid)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- treesitter-based folding
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}
