vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/seblyng/roslyn.nvim" },
})

--------------------------------------------------
-- Mason
--------------------------------------------------

require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

--------------------------------------------------
-- blink completion capabilities
--------------------------------------------------

local capabilities = require("blink.cmp").get_lsp_capabilities()

--------------------------------------------------
-- Lua
--------------------------------------------------

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

--------------------------------------------------
-- Typescript / Javascript
--------------------------------------------------

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

--------------------------------------------------
-- C#
--------------------------------------------------

require("roslyn").setup({})

--------------------------------------------------
-- enable servers
--------------------------------------------------

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
})

--------------------------------------------------
-- keymaps
--------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})
