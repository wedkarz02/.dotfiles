vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/benomahony/oil-git.nvim",
})

local Oil = require("oil")
Oil.setup({
  view_options = {
    show_hidden = true,
  },
  float = {
    max_width = 0.8,
    max_height = 0.8,
    border = "rounded",
  },
  confirmation = {
    border = "rounded",
  },
})
