vim.pack.add({ "https://github.com/alexghergh/nvim-tmux-navigation" })

local NvimTmuxNavigation = require("nvim-tmux-navigation")
NvimTmuxNavigation.setup({
  keybindings = {
    left = "<C-h>",
    down = "<C-j>",
    up = "<C-k>",
    right = "<C-l>",
    last_active = "<C-\\>"
  }
})

