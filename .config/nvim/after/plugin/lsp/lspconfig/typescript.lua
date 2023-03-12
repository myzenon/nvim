local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach_lsp = require('zenon.lsp.on_attach')
-- local format_on_save = require('zenon.lsp.format_on_save')
local capabilities = require('zenon.lsp.capabilities')

local on_attach = function(client, bufnr)
    on_attach_lsp(client, bufnr)
    -- Disable lsp format, use eslint
    client.server_capabilities.documentFormattingProvider = false
    -- format_on_save(client, bufnr)
end

-- Typescript
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'json',
        'javascript',
        'javascriptreact',
        'javascript.jsx',
    },
    init_options = {
        preferences = {
            quotePreference = 'single',
        },
    },
}
