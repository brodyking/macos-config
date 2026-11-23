return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			filters = {
				dotfiles = true, -- Set to true to hide hidden files (like .git, .env, etc.) by default
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr) -- keep defaults, then add/override

				vim.keymap.set("n", "cd", api.tree.change_root_to_node, { buffer = bufnr, desc = "CD into directory" })
			end,
		})
	end,
}
