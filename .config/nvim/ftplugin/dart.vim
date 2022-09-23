set tabstop=2         " Use 2 space tabs
set shiftwidth=2      " Use 2 space tabs

" Keymaps
nnoremap <leader>fs <Cmd>:FlutterRun<CR>
nnoremap <leader>fe <Cmd>:FlutterEmulators<CR>
nnoremap <leader>fo <Cmd>:FlutterOutlineToggle<CR>
nnoremap <leader>fq <Cmd>:FlutterQuit<CR>
nnoremap <leader>fr <Cmd>:FlutterRestart<CR>
nnoremap <leader>fR <Cmd>:FlutterReload<CR>
nnoremap <leader>fd <Cmd>:FlutterVisualDebug<CR>
nnoremap <leader>fc <Cmd>lua require('telescope').extensions.flutter.commands()<CR>
