vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Turn off the search highlight" })

vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to the plus register (system clipboard)" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from the plus register (system clipboard)" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "J", "mzJ'z", { desc = "Keep the cursor in place after line join" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down jump with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up jump with cursor centered" })

vim.keymap.set("n", "<leader>u", function()
  vim.cmd.packadd("nvim.undotree")
  require("undotree").open()
end, { desc = "Toggle undotree" })

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory with oil.nvim" })

