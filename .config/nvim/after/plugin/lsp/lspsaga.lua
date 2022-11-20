local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
    server_filetype_map = {
        typescript = 'typescript'
    }
}

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'ca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)

-- Show line diagnostics
vim.keymap.set('n', 'E', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)

-- Show cursor diagnostic
vim.keymap.set('n', 'E', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)

-- Diagnsotic jump can use `<c-o>` to jump back
vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Only jump to error
vim.keymap.set('n', '[E', function()
    require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set('n', ']E', function()
    require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

