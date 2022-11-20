-- Set default encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true -- Show number
vim.wo.relativenumber = true -- Show relative number

-- vim.opt.showmatch = true -- Show matching braces
-- vim.opt.showcmd = true -- Show the current command in the bottom right
-- vim.opt.mat = 1 -- Set the time to show matching braces to 1 second
-- vim.opt.mouse = "a" -- Disable mouse

-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

-- vim.opt.undolevels = 1000 -- Set the number of undos that are remembered
-- vim.opt.incsearch = true -- Incremental search: jump to the first occurrence of search while the user is still searching

vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.title = true -- Show title on terminal
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true -- Use case sensitive search if there is a capital letter in the search
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.shiftwidth = 4 -- Use 4 space tabs
vim.opt.tabstop = 4 -- Use 4 space tabs
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.splitbelow = true -- Make horizontal splits below instead of above
vim.opt.splitright = true -- Make vertical splits on the right
vim.opt.scrolloff = 10 -- Start scrolling when the cursor is 10 lines away from the bottom of the window
vim.opt.cursorline = true -- Highlight the current line
vim.opt.autoread = true -- Automatically reload the file when it is changed from an outside program
vim.opt.wrap = false -- No Wrap lines
vim.opt.termguicolors = true -- Set correct color
vim.opt.backup = false -- Disable backup

vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.opt.foldenable = false
-- vim.opt.signcolumn = "true"
vim.opt.completeopt = "menu,menuone,noselect"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Disable 's'
vim.cmd [[map s <Nop>]]