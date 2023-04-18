local status, packer = pcall(require, 'packer')
if (not status) then return end

local use = packer.use

-- Language Protocol Server Configuration
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'
use 'lukas-reineke/lsp-format.nvim'
use 'ray-x/lsp_signature.nvim'
use 'RishabhRD/popfix'
-- use 'hood/popui.nvim'
use 'stevearc/dressing.nvim'
use 'folke/trouble.nvim'
use 'nvim-treesitter/nvim-treesitter'
use 'sheerun/vim-polyglot'
use 'stevearc/aerial.nvim'
use 'simrat39/symbols-outline.nvim'

-- Auto Completion
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'
use 'L3MON4D3/LuaSnip'

-- Styling
use 'onsails/lspkind.nvim'
use 'glepnir/lspsaga.nvim'
use 'folke/lsp-colors.nvim'

-- Rust
use 'rust-lang/rust.vim'
use 'simrat39/rust-tools.nvim'
use 'mfussenegger/nvim-dap'
use 'timonv/vim-cargo'

-- Flutter
use 'dart-lang/dart-vim-plugin'
use 'akinsho/flutter-tools.nvim'

-- Null LS
use 'jose-elias-alvarez/null-ls.nvim'

