local status, rust_tools = pcall(require, 'rust-tools')
if (not status) then return end

local keymap = vim.keymap
local on_attach_lsp = require('zenon.lsp.on_attach')
local format_on_save = require('zenon.lsp.format_on_save')
local capabilities = require('zenon.lsp.capabilities')

local set_key_map = function(client, bufnr)
    -- Hover actions
    keymap.set('n', 'ha', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
    -- Code action groups
    keymap.set('n', 'cga', rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    -- Runnables
    keymap.set('n', 'rr', rust_tools.runnables.runnables, { buffer = bufnr })
    -- Parent Module
    keymap.set('n', 'rp', rust_tools.parent_module.parent_module, { buffer = bufnr })
    -- Debuggables
    keymap.set('n', '<leader>rd', rust_tools.debuggables.debuggables, { buffer = bufnr })
    -- Open Cargo Toml
    keymap.set('n', '<leader>rc', rust_tools.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
end

local on_attach = function(client, bufnr)
    on_attach_lsp(client, bufnr)
    format_on_save(client, bufnr)
    set_key_map(client, bufnr)
end

rust_tools.setup {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
}
