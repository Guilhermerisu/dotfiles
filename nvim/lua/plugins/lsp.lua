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
    vim.keymap.set("n", "<leader>xd", vim.lsp.buf.definition, { buffer = event.buf, desc = "LSP Definition" })
    vim.keymap.set("n", "<leader>xr", vim.lsp.buf.references, { buffer = event.buf, desc = "LSP References" })
    vim.keymap.set("n", "<leader>xk", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP Hover Docs" })
    vim.keymap.set("n", "<leader>xn", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP Rename Symbol" })
    vim.keymap.set("n", "<leader>xa", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP Code Action" })
  end,
})
