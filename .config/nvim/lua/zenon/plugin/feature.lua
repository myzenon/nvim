local status, packer = pcall(require, 'packer')
if (not status) then return end

local use = packer.use

-- Markdown Preview
use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

-- Telescope
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'nvim-telescope/telescope-file-browser.nvim'

-- Autoswap management
use 'gioele/vim-autoswap'

-- Git
use 'tpope/vim-fugitive'      -- Git
use 'tpope/vim-rhubarb'       -- Github
use 'junegunn/gv.vim'         -- Graph
use 'lewis6991/gitsigns.nvim' -- Show sign
use 'kdheepak/lazygit.nvim'
-- use 'airblade/vim-gitgutter' -- Show sign
-- use 'chrisbra/changesplugin' -- Show sign
-- use 'zivyangll/git-blame.vim' -- Git Blame

-- Dictionary
use 'kamykn/spelunker.vim'

-- Github Copilot
-- use 'github/copilot.vim'
use 'zbirenbaum/copilot.lua'

-- Move in word
use 'kana/vim-smartword'
use 'bkad/camelcasemotion'
