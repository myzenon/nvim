local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup {
    -- highlight = {
        -- enable = true,
        -- disable = {},
    -- },
    -- indent = {
        -- enable = true,
        -- disable = {},
    -- },
    ensure_installed = {
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
