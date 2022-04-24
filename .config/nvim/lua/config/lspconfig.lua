local lspconfig = require("lspconfig")
local on_attach = require("config/shared/on_attach")
local buf_map = require("util").buf_map

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({
    init_options = {
      preferences = {
        importModuleSpecifierPreference = "relative",
      },
    },
    capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

        on_attach(client, bufnr)
    end,
})

vim.diagnostic.config({ severity_sort = true })

local signs = { Error = ">>", Warn = ">>", Hint = ">>", Info = ">>" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

