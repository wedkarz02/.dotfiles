require("vim._core.ui2").enable({})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "options"
require "keymaps"
require "commands"
require "autocmds"

require "plugins.catppuccin"
require "plugins.oil"
require "plugins.mini"
require "plugins.gitsigns"

