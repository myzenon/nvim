local status, mason = pcall(require, 'mason')
if (not status) then return end
local status, lspconfig = pcall(require, 'mason-lspconfig')
if (not status) then return end

mason.setup()

lspconfig.setup {
    automatic_installation = true,
    ensure_installed = {
        'eslint',
        'cssmodules_ls',
        'cssls',
        'dockerls',
        'diagnosticls',
        'lua_ls',
        'html',
        'ruby_ls',
        'rust_analyzer',
        'stylelint_lsp',
        'terraformls',
        'tsserver',
        'volar',
        'vuels',
    }
}
