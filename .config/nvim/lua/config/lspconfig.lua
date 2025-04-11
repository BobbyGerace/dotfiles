local lspconfig = require("lspconfig")
local on_attach = require("config/shared/on_attach")

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.diagnostic.config({
  virtual_lines = {
   -- Only show virtual line diagnostics for the current cursor line
   current_line = true,
  },
})


lspconfig.ts_ls.setup({
  init_options = vim.tbl_deep_extend(
    'force',
    require("nvim-lsp-ts-utils").init_options,
    {
      preferences = {
        importModuleSpecifierPreference = "relative",
      },
    }
  ),
  capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup {}
    ts_utils.setup_client(client)

    on_attach(client, bufnr)
  end,
})

local lua_ls_binary_path = vim.fn.exepath('lua-language-server')
-- The config will break if we try to set this up without lls actually installed
if lua_ls_binary_path ~= "" then
  local lua_ls_root_path = vim.fn.fnamemodify(lua_ls_binary_path, ':h')

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  lspconfig.lua_ls.setup {
    cmd = { lua_ls_binary_path, "-E", lua_ls_root_path .. "/main.lua" };
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

lspconfig.hls.setup {
  on_attach = on_attach
}

lspconfig.tailwindcss.setup{}

vim.diagnostic.config({ severity_sort = true })

local signs = { Error = ">>", Warn = ">>", Hint = ">>", Info = ">>" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
