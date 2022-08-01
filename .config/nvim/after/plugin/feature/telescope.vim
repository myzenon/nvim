" TeleScope
if !exists('g:loaded_telescope') | finish | endif

lua << EOF
require('telescope').setup{
    defaults = {
        initial_mode = "normal"
    },
}
EOF
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <C-\> <cmd>Telescope live_grep<CR>
nnoremap <C-]> <cmd>Telescope buffers<CR><ESC>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>