local on_attach = require("config/shared/on_attach")
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.diagnostic.config({
  virtual_lines = {
   -- Only show virtual line diagnostics for the current cursor line
   current_line = true,
  },
})

-- Rust
vim.lsp.config.rust_analyzer = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Lua Language Server
local lua_ls_binary_path = vim.fn.exepath('lua-language-server')
if lua_ls_binary_path ~= "" then
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  vim.lsp.config.lua_ls = {
    cmd = { lua_ls_binary_path },
    filetypes = { 'lua' },
    on_attach = on_attach,
    capabilities = capabilities,
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

-- ESLint
vim.lsp.config.eslint = {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  capabilities = capabilities,
}

-- Haskell
vim.lsp.config.hls = {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell', 'lhaskell' },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Tailwind CSS
vim.lsp.config.tailwindcss = {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'sass', 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  capabilities = capabilities,
}

vim.diagnostic.config({ severity_sort = true })

local x = vim.diagnostic.severity

vim.diagnostic.config {
  signs  = { text = { [x.ERROR] = ">>", [x.WARN] = ">>", [x.HINT] = ">>", [x.INFO] = ">>" } },
  underline = true
}
