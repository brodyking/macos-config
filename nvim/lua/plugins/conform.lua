return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- load just before you'd need it, not at startup
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- use the LSP's formatter if no conform formatter matches
    },
  },
}
