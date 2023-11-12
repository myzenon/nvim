require('mini.files').setup()

-- vim.keymap.set('n', 'mf', ':lua MiniFiles.open()<CR>')
vim.keymap.set('n', 'mk', ':lua MiniFiles.open(vim.fn.expand("%:p:h"))<CR>')
