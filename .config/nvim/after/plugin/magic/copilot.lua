local keymap = vim.keymap

keymap.set('i', '<silent><script><expr> <C-A>', 'copilot#Accept("<CR>")')
vim.g.copilot_no_tab_map = true
