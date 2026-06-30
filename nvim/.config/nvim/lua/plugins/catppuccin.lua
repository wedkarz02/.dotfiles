vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

local Catppuccin = require("catppuccin")
Catppuccin.setup({
  flavour = "mocha",
  transparent_background = false,
})

vim.cmd.colorscheme("catppuccin-nvim")

