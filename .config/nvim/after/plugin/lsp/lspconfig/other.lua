local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach_lsp = require('zenon.lsp.on_attach')
local format_on_save = require('zenon.lsp.format_on_save')
local capabilities = require('zenon.lsp.capabilities')

-- Docker
nvim_lsp.dockerls.setup {
    on_attach = on_attach_lsp,
    capabilities = capabilities,
}

-- Terraform
nvim_lsp.terraformls.setup {
    on_attach = function(client, bufnr)
        on_attach_lsp(client, bufnr)
        format_on_save(client, bufnr)
    end,
    capabilities = capabilities,
}

-- Ruby
nvim_lsp.ruby_ls.setup {
    on_attach = on_attach_lsp,
    capabilities = capabilities,
}