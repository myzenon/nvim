local status, packer = pcall(require, 'packer')
if (not status) then return end

local use = packer.use

-- Surround
use 'ur4ltz/surround.nvim'

-- System Copy
use 'christoomey/vim-system-copy'

-- Replace with register
use 'vim-scripts/ReplaceWithRegister'

-- Comment things
use 'tpope/vim-commentary'

-- Repeat with plugins support
use 'tpope/vim-repeat'

-- Move
use 'matze/vim-move'

-- Multi cursor
use 'mg979/vim-visual-multi'

-- Easy motion
use 'easymotion/vim-easymotion'

-- Command next target
use 'wellle/targets.vim'

-- Split and Join snippet code
use 'andrewradev/splitjoin.vim'

-- Auto Close Parentheses
use 'cohama/lexima.vim'

-- Auto Close Tag
-- use 'alvan/vim-closetag'
use 'windwp/nvim-ts-autotag'

-- Emmet
use 'mattn/emmet-vim'

-- Tmux
use({
    'aserowy/tmux.nvim',
    config = function() return require('tmux').setup() end
})
