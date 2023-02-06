-- Git Blame
-- vim.keymap.set('n', '<leader>gb', ':<C-u>call gitblame#echo()<CR>')

-- Fugitive
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>')

-- Git Signs
require('gitsigns').setup()
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>')

-- Lazy Git
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')
