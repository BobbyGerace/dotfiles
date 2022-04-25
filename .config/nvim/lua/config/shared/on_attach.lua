local buf_map = require("util").buf_map

local function bmap(mode, l, r, desc, opts)
  opts = opts or {}
  opts.buffer = bufnr
  map(mode, l, r, desc, opts)
end


local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")    

    local function bmap(mode, l, r, desc, opts)
      opts = opts or {}
      opts.buffer = bufnr
      map(mode, l, r, desc, opts)
    end

    map("n", "gy", ":LspTypeDef<CR>", 'go to type definition')
    map("n", "K", ":LspHover<CR>", 'show documentation')
    map("n", "[e", ":LspDiagPrev<CR>", 'next diagnostic')
    map("n", "]e", ":LspDiagNext<CR>", 'previous diagnostic')
    map("n", "ga", ":LspCodeAction<CR>", 'go to code action')
    map("n", "ge", ":LspDiagLine<CR>", 'show diagnostics for line')

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

return on_attach
