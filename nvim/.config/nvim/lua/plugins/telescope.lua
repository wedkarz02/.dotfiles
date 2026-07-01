vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local Telescope = require("telescope")
Telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "%.git/",
      "target/",
      "node_modules/",
      "%.cache/",
      "%.npm/",
      "%.venv/",
      "venv/",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      follow = true,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

pcall(Telescope.load_extension, "fzf")
pcall(Telescope.load_extension, "ui-select")

local TelescopeBuiltin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", TelescopeBuiltin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", TelescopeBuiltin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", TelescopeBuiltin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", TelescopeBuiltin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set({ "n", "v" }, "<leader>sw", TelescopeBuiltin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", TelescopeBuiltin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", TelescopeBuiltin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", TelescopeBuiltin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", TelescopeBuiltin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>sc", TelescopeBuiltin.commands, { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "<leader><leader>", TelescopeBuiltin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set(
  "n",
  "<leader>/",
  TelescopeBuiltin.current_buffer_fuzzy_find,
  { desc = "[/] Fuzzily search in current buffer" }
)
vim.keymap.set(
  "n",
  "<leader>s/",
  function() TelescopeBuiltin.live_grep({ grep_open_files = true, prompt_title = "Live grep in open files" }) end,
  { desc = "[S]earch [/] in open files" }
)
vim.keymap.set(
  "n",
  "<leader>sn",
  function() TelescopeBuiltin.find_files({ cwd = vim.fn.stdpath("config"), follow = true }) end,
  { desc = "[S]earch [N]eovim files" }
)
