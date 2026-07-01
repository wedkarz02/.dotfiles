vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

local Gitsigns = require("gitsigns")
Gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})
