local status, packer = pcall(require, 'packer')
if (not status) then return end

local use = packer.use

-- Icon
use 'kyazdani42/nvim-web-devicons'

-- Transparent
use 'tribela/vim-transparent'

-- Fancy
use 'dbarsam/vim-rainbow-parentheses'
use 'nathanaelkane/vim-indent-guides'
use 'ap/vim-css-color'
use 'valloric/matchtagalways'
use 'machakann/vim-highlightedyank'
use 'ntpeters/vim-better-whitespace'

-- Bar
use 'mkitt/tabline.vim'
use 'vim-airline/vim-airline'
use 'vim-airline/vim-airline-themes'

-- Zen Mode
use 'folke/zen-mode.nvim'
-- use 'Pocco81/true-zen.nvim'

-- Color Scheme
-- use 'arcticicestudio/nord-vim'
-- use 'junegunn/seoul256.vim'
use 'nanotech/jellybeans.vim'
-- use 'rebelot/kanagawa.nvim'
-- use 'aktersnurra/no-clown-fiesta.nvim'
-- use 'shaunsingh/nord.nvim'

-- Twilight Mode
use 'folke/twilight.nvim'
