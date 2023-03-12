local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach_lsp = require('zenon.lsp.on_attach')
local capabilities = require('zenon.lsp.capabilities')

local on_attach = function(client, bufnr)
    on_attach_lsp(client, bufnr)
    vim.api.nvim_create_autocmd(
        'BufWritePre',
        {
            buffer = bufnr,
            command = 'EslintFixAll',
        }
    )
end

-- ESLint
nvim_lsp.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        packageManager = 'yarn'
    }
}
