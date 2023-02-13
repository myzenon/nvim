local mason_status, mason = pcall(require, "mason")
if (not mason_status) then return end
local mason_lsp_config_status, lspconfig = pcall(require, "mason-lspconfig")
if (not mason_lsp_config_status) then return end

mason.setup({

})

lspconfig.setup {
    automatic_installation = true,
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "volar",
        "tsserver",
        "stylelint_lsp",
        "html",
        "dockerls",
        "cssls",
        "cssmodules_ls",
        "diagnosticls",
        "eslint",
        "terraformls",
        "ruby_ls",
        "vuels",
    }
}
