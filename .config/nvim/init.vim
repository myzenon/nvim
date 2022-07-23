set number
set relativenumber
set wrap!
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set hlsearch!
set ignorecase
set smartcase
set termguicolors
set splitright

call plug#begin()
Plug 'ur4ltz/surround.nvim'
Plug 'christoomey/vim-system-copy'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ciaranm/detectindent'
Plug 'tpope/vim-repeat'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kjwon15/vim-transparent'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'feline-nvim/feline.nvim'
Plug 'gioele/vim-autoswap'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mkitt/tabline.vim'
Plug 'kassio/neoterm'
Plug 'justinmk/vim-gtfo'
Plug 'matze/vim-move'
Plug 'github/copilot.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'drzel/vim-gui-zoom'
Plug 'kana/vim-smartword'
Plug 'bkad/camelcasemotion'
Plug 'easymotion/vim-easymotion'
Plug 'kamykn/spelunker.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'timonv/vim-cargo'
" Plug 'chaoren/vim-wordmotion'
" Plug 'ayu-theme/ayu-vim' " or other package manager
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'arcticicestudio/nord-vim'
" Plug 'KeitaNakamura/neodark.vim' 
Plug 'junegunn/seoul256.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

lua require"surround".setup{mappings_style = "surround"}

" Vim Move
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'
" Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <C-z> :FloatermToggle<CR>

" TeleScope
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-\> <cmd>Telescope live_grep<CR>
nnoremap <C-]> <cmd>Telescope buffers<CR><ESC>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Vim CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" Vim EasyMotion
" " Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Copilot
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" NeoVide
set guifont=MesloLGS\ NF:h16
let g:neovide_transparency=0.8
let g:neovide_scroll_animation_length = 0.1
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0
let g:neovide_touch_deadzone=60.0
let g:neovide_touch_drag_timeout=0.17
let g:neovide_input_use_logo=v:true
let g:neovide_input_macos_alt_is_meta=v:false
set mouse=a
nmap <c-+> :ZoomIn<CR>
nmap <c--> :ZoomOut<CR>
" set clipboard=unnamedplus
" nmap <c-c> "+y
" vmap <c-c> "+y
" nmap <c-v> "+p
" " inoremap <c-v> <c-r>+
" cnoremap <c-v> <c-r>+
inoremap <D-v> <c-r>+
cnoremap <D-v> <c-r>+
" inoremap <M-v> <M-r>+
" cnoremap <M-v> <M-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
" inoremap <c-r> <c-v>
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
lua << EOF
require('telescope').setup{
    defaults = {
        initial_mode = "normal"
    },
}
EOF

" NvimTree
lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list_binds = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "<C-e>",                          action = "edit_in_place" },
    { key = "O",                              action = "edit_no_picker" },
    { key = { "<C-i>", "<2-RightMouse>" },    action = "cd" },
    { key = "<C-v>",                          action = "vsplit" },
    { key = "<C-x>",                          action = "split" },
    { key = "t",                          action = "tabnew" },
    { key = "<",                              action = "prev_sibling" },
    { key = ">",                              action = "next_sibling" },
    { key = "P",                              action = "parent_node" },
    { key = "<BS>",                           action = "close_node" },
    { key = "<C-t>",                          action = "preview" },
    { key = "K",                              action = "first_sibling" },
    { key = "J",                              action = "last_sibling" },
    { key = "I",                              action = "toggle_git_ignored" },
    { key = "H",                              action = "toggle_dotfiles" },
    { key = "U",                              action = "toggle_custom" },
    { key = "R",                              action = "refresh" },
    { key = "a",                              action = "create" },
    { key = "d",                              action = "remove" },
    { key = "D",                              action = "trash" },
    { key = "r",                              action = "rename" },
    { key = "<C-r>",                          action = "full_rename" },
    { key = "x",                              action = "cut" },
    { key = "c",                              action = "copy" },
    { key = "p",                              action = "paste" },
    { key = "y",                              action = "copy_name" },
    { key = "Y",                              action = "copy_path" },
    { key = "gy",                             action = "copy_absolute_path" },
    { key = "[c",                             action = "prev_git_item" },
    { key = "]c",                             action = "next_git_item" },
    { key = "-",                              action = "dir_up" },
    { key = "s",                              action = "system_open" },
    { key = "<C-f>",                          action = "live_filter" },
    { key = "<C-F>",                          action = "clear_live_filter" },
    { key = "q",                              action = "close" },
    { key = "W",                              action = "collapse_all" },
    { key = "E",                              action = "expand_all" },
    { key = "S",                              action = "search_node" },
    { key = ".",                              action = "run_file_command" },
    { key = "<C-k>",                          action = "toggle_file_info" },
    { key = "g?",                             action = "toggle_help" },
}

require'nvim-tree'.setup {
    create_in_closed_folder = true,
    open_on_tab = false,
    git = {
        ignore = false,
    },
	view = {
        number = true,
        relativenumber = true,
		mappings = {
    		list = list_binds,
            custom_only = true,
    	},
	},
    filters = {
    	dotfiles = false,
		custom = {
            '.DS_Store',
		    '.git',
		    'node_modules',
		    '.cache',
		    '*.o',
		}
    },
    update_cwd = true,
    update_focused_file = {
    	enable = true,
    	update_cwd = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = false,
        },
    },
	trash = {
		cmd = "trash",
        require_confirm = true,
	},
}
EOF

" let g:aqua_transparency = 1
" let g:airline_theme="base16_aquarium_dark"
" let g:aquarium_style="dark"
" colorscheme aquarium
" colorscheme nord
" let g:neodark#terminal_transparent = 1
" let g:neodark#solid_vertsplit = 1
" colorscheme neodark
colo seoul256
" colorscheme dracula
" lua require"feline".setup{}
nnoremap <silent> K :call ShowDocumentation()<CR>

"""""""" Vim-Indent-Guides
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey
autocmd VimEnter * :IndentGuidesEnable

""""""" Coc
" Keys
nnoremap <C-S-F> :CocCommand formatJson --indent=4<CR>
" nnoremap <C-F> :CocCommand formatJson --indent=4<CR>
nnoremap <C-S-V> :CocCommand volar.action.splitEditors<CR>
" nnoremap <C-V> :CocCommand volar.action.splitEditors<CR>
nnoremap <C-S-N> :CocCommand volar.action.nuxt<CR>
" nnoremap <C-N> :CocCommand volar.action.nuxt<CR>
nnoremap <C-S-R> :CocRestart<CR>
nnoremap <leader>rr :CocRestart<CR>

""""""" Nvim-Tree
" Keys
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <Tab><Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
" nnoremap <C-t> :tabnew \| :NvimTreeOpen<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <silent>ff 1gt \| :NvimTreeRefresh<CR>

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

" set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue


"""""""" Coc From Example
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
