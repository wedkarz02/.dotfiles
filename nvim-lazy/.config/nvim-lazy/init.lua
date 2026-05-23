-- [[
--     My Neovim config is a heavily modified kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim).
--     I've left the comments from kickstart.nvim because they are quite useful.
--
--     kickstart.nvim is licensed under the MIT License.
--     Copyright (c) kickstart.nvim contributors
-- ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Set options ]]
require 'config.options'

-- [[ Set keymaps ]]
require 'config.keymaps'

-- [[ Configure autocommands ]]
require 'config.autocmds'

-- [[ Configure and install plugins ]]
require 'config.lazy'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
