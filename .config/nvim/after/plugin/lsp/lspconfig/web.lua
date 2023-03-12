local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = require('zenon.lsp.on_attach')
-- local format_on_save = require('zenon.lsp.format_on_save')
local capabilities = require('zenon.lsp.capabilities')

-- HTML
nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- CSS, SCSS, LESS
nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- CSS Modules (e.g, React)
nvim_lsp.cssmodules_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Stylelint (for formatting css)
nvim_lsp.stylelint_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}