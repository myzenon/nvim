local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach_lsp = require('zenon.lsp.on_attach')
local format_on_save = require('zenon.lsp.format_on_save')
local capabilities = require('zenon.lsp.capabilities')

local on_attach = function(client, bufnr)
    on_attach_lsp(client, bufnr)
    format_on_save(client, bufnr)
end

nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false
            },
        },
    },
}