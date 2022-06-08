set number
set relativenumber
set wrap!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set hlsearch!

call plug#begin()
Plug 'ur4ltz/surround.nvim'
Plug 'christoomey/vim-system-copy'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ciaranm/detectindent'
" Plug 'pangloss/vim-javascript'
" Plug 'elzr/vim-json'
call plug#end()

lua require"surround".setup{mappings_style = "surround"}
lua require'nvim-tree'.setup {}

"""""""" Ayu-Vim
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

"""""""" Vim-Indent-Guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

""""""" Coc
" Keys
nnoremap <C-f> :CocCommand formatJson --indent=4<CR>

""""""" Nvim-Tree
" Keys
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-q>     :tabclose<CR>

" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>
" inoremap <C-S-w>   <Esc>:tabclose<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue

