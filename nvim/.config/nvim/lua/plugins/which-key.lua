vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local WhichKey = require("which-key")
WhichKey.setup({
  delay = 0,
  icons = { mappings = true },
  spec = {
    { "<leader>s", group = "[S]earch" },
    { "<leader>t", group = "[T]oggle" },
    { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
    { "gr", group = "LSP Actions", mode = { "n" } }
  }
})

