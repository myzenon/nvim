" TeleScope
if !exists('g:loaded_telescope') | finish | endif

lua << EOF
local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

require("telescope").load_extension("flutter")
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    initial_mode = "normal",
    layout_strategies = "horizontal",
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      layout_config = { height = 400 },
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["a"] = fb_actions.create,
          ["p"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', ';b', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 400 }
  })
end)
EOF
nnoremap <Tab><Tab> <cmd>bnext<CR>
nnoremap <S-Tab> <cmd>bprevious<CR>
nnoremap <C-Tab> <cmd>tabnext<CR>
nnoremap <C-S-Tab> <cmd>tabprevious<CR>
" lua << EOF
" require('telescope').setup{
"     defaults = {
"         initial_mode = "normal"
"     },
" }
" EOF
" nnoremap <C-p> <cmd>Telescope find_files<CR>
" nnoremap <C-\> <cmd>Telescope live_grep<CR>