local Plug = vim.fn['plug#']

vim.call('plug#begin')

require('zenon.plugin.feature')
require('zenon.plugin.lsp')
require('zenon.plugin.magic')
require('zenon.plugin.theme')

vim.call('plug#end')
