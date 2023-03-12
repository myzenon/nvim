-- Diagnostics
vim.diagnostic.config({
    float = {
        source = "always", -- Or "if_many"
    },
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        update_in_insert = true,
        virtual_text = { spacing = 6, prefix = '●' },
        severity_sort = true,
    }
)

-- In front of signs
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end