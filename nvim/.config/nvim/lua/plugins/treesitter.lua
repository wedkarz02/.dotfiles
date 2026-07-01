vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

local Treesitter = require("nvim-treesitter")

local ensure_installed = {
  -- languages
  "rust",
  "go",
  "cpp",
  "bash",
  "python",
  "javascript",
  "typescript",
  "sql",

  -- extras
  "diff",
  "html",
  "luadoc",
  "css",
  "json",
  "toml",
}

Treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then return end

    local ok_add = pcall(vim.treesitter.language.add, lang)
    if not ok_add then return end

    pcall(vim.treesitter.start, buf, lang)
  end,
})
