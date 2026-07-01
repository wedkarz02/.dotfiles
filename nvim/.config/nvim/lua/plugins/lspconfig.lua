vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

local Mason = require("mason")
Mason.setup({})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    -- Added descriptions to the default neovim keymaps for nicer which-key.nvim integration
    vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "[G]oto [I]mplementation" })
    vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "[G]oto [T]ype Definition" })
    vim.keymap.set("n", "grr", vim.lsp.buf.references, { buffer = ev.buf, desc = "[G]oto [R]eferences" })
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[R]e[n]ame" })
    vim.keymap.set("n", "grx", vim.lsp.codelens.run, { buffer = ev.buf, desc = "E[x]ecute Codelens" })
    vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "[G]oto Code [A]ction" })
    vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, { buffer = ev.buf, desc = "Open Document Symbols" })
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show documentation" })

    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "[G]oto [D]eclaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Goto Definition" })

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/inlayHint", ev.buf) then
      vim.keymap.set(
        "n",
        "<leader>th",
        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })) end,
        { buffer = ev.buf, desc = "[T]oggle Inlay [H]ints" }
      )
    end
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())
vim.lsp.config("*", { capabilities = capabilities })

local servers = {
  rust_analyzer = {},
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
