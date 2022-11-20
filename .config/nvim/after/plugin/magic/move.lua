local keymap = vim.keymap

-- EasyMotion
keymap.set('', '/',  '<Plug>(easymotion-sn)')
keymap.set('o', '/', '<Plug>(easymotion-tn)')

-- These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
-- Without these mappings, `n` & `N` works fine. (These mappings just provide
-- different highlight method and have some other features )
keymap.set('', 'n',  '<Plug>(easymotion-next)')
keymap.set('', 'N',  '<Plug>(easymotion-prev)')
