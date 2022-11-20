-- Setting
vim.opt.tabstop = 2 -- Use 2 space tabs
vim.opt.shiftwidth = 2 -- Use 2 space tabs

-- Keymap
local keymap = vim.keymap

keymap.set('n', '<leader>fs', ':FlutterRun<CR>')
keymap.set('n', '<leader>fe', ':FlutterEmulators<CR>')
keymap.set('n', '<leader>flc', ':FlutterLogClear<CR>')
keymap.set('n', '<leader>fo', ':FlutterOutlineToggle<CR>')
keymap.set('n', '<leader>fq', ':FlutterQuit<CR>')
keymap.set('n', '<leader>fr', ':FlutterRestart<CR>')
keymap.set('n', '<leader>fR', ':FlutterReload<CR>')
keymap.set('n', '<leader>fd', ':FlutterVisualDebug<CR>')
keymap.set('n', '<leader>fc', ':lua require("telescope").extensions.flutter.commands()<CR>')
