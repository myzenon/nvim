" NvimTree
lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list_binds = {
    { key = "t",                          action = "tabnew" },
}

local list_binds_2 = {
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
    remove_keymaps = {
        "<Tab>",
    },
	view = {
        number = true,
        relativenumber = true,
        -- DEPECATED and have trouble
		 mappings = {
            list = list_binds,
            -- custom_only = true,
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
" Keys
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <Tab><Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <silent>ff 1gt \| :NvimTreeRefresh<CR>
