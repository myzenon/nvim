local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {
            'dart'
        },
    },
    sync_installed = {
        'astro',
        'tsx',
        'toml',
        'php',
        'json',
        'yaml',
        'css',
        'html',
        'lua',
        'typescript',
        'vue',
        'dart',
        'markdown',
        'markdown_inline',
    },
    autotag = {
        enable = true,
    },
}
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'json',
    'javascript',
    'javascriptreact',
    'javascript.jsx',
}
parser_config.astro = 'tsx'
