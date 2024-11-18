-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Change leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.scriptencoding = "utf-8"

local opt = vim.opt

-- Remove weird space
opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}

opt.clipboard = ""

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.cmdheight = 1
opt.laststatus = 2
opt.shell = "zsh"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.smarttab = true
opt.breakindent = true
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

opt.title = true -- Show title on terminal
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smartcase = true -- Use case sensitive search if there is a capital letter in the search
opt.hlsearch = false -- Don't highlight search results
opt.shiftwidth = 4 -- Use 4 space tabs
opt.tabstop = 4 -- Use 4 space tabs
opt.expandtab = true -- Use spaces instead of tabs
opt.splitbelow = true -- Make horizontal splits below instead of above
opt.splitright = true -- Make vertical splits on the right
opt.scrolloff = 10 -- Start scrolling when the cursor is 10 lines away from the bottom of the window
opt.cursorline = true -- Highlight the current line
opt.autoread = true -- Automatically reload the file when it is changed from an outside program
opt.wrap = false -- No Wrap lines
opt.termguicolors = true -- Set correct color
opt.backup = false -- Disable backup

opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5

-- Lazy redraw
-- vim.cmd([[ set lazyredraw ]])

-- TTY Fast
vim.cmd([[ set ttyfast ]])

-- Disable ESLint auto format
vim.g.lazyvim_eslint_auto_format = false
