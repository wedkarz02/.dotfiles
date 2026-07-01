vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local Conform = require("conform")
Conform.setup({
  notify_on_error = true,
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
  },

  vim.keymap.set("n", "<leader>f", function() Conform.format({ async = true }) end, { desc = "[F]ormat Local Buffer" }),
})
