local Plug = vim.fn['plug#']

-- Markdown Preview
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })

-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

-- Autoswap management
Plug 'gioele/vim-autoswap'

-- Git
Plug 'tpope/vim-fugitive' -- Git
Plug 'tpope/vim-rhubarb' -- Github
Plug 'junegunn/gv.vim' -- Graph
Plug 'lewis6991/gitsigns.nvim' -- Show sign
Plug 'kdheepak/lazygit.nvim'
-- Plug 'airblade/vim-gitgutter' -- Show sign
-- Plug 'chrisbra/changesplugin' -- Show sign
-- Plug 'zivyangll/git-blame.vim' -- Git Blame

-- Dictionary
Plug 'kamykn/spelunker.vim'

-- Github Copilot
Plug 'github/copilot.vim'

-- Move in word
Plug 'kana/vim-smartword'
Plug 'bkad/camelcasemotion'
