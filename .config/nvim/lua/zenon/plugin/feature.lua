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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'chrisbra/changesplugin'
Plug 'zivyangll/git-blame.vim'

-- Dictionary
Plug 'kamykn/spelunker.vim'

-- Github Copilot
Plug 'github/copilot.vim'

-- Move in word
Plug 'kana/vim-smartword'
Plug 'bkad/camelcasemotion'