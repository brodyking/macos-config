return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				preview = {
					treesitter = false,
				},
			},
		})

		local builtin = require("telescope.builtin")
		-- Search
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search w/ Grep" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search Buffers" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help Tags" })
		-- LSP
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Goto references" })
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Goto definitions" })
		-- Symbols
		vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Search symbols (buffer)" })
		vim.keymap.set(
			"n",
			"<leader>sS",
			builtin.lsp_dynamic_workspace_symbols,
			{ desc = "Search symbols (workspace)" }
		)
	end,
	opts = {
		defaults = {
			preview = {
				treesitter = false,
			},
		},
	},
}
