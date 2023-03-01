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

-- Files
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

-- LSP
vim.keymap.set('n', ';e', function()
    builtin.diagnostics({
        bufnr = 0
    })
end)
vim.keymap.set('n', ';E', function()
    builtin.diagnostics()
end)
vim.keymap.set('n', ';v', function()
    builtin.lsp_document_symbols()
end)
vim.keymap.set('n', ';V', function()
    builtin.lsp_dynamic_workspace_symbols()
end)

-- Git
vim.keymap.set('n', '<leader>gs', function()
    builtin.git_status()
end)
vim.keymap.set('n', '<leader>gB', function()
    builtin.git_branches()
end)
