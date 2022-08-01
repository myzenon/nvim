" Vim Move
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

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