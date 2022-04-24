local null_ls = require("null-ls")
local on_attach = require("config/shared/on_attach")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})
