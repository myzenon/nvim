local status, flutter_tools = pcall(require, 'flutter-tools')
if (not status) then return end

local keymap = vim.keymap
local on_attach_lsp = require('zenon.lsp.on_attach')
local format_on_save = require('zenon.lsp.format_on_save_vim')
local capabilities = require('zenon.lsp.capabilities')

local set_key_map = function()
    keymap.set('n', '<leader>fs', ':FlutterRun<CR>')
    keymap.set('n', '<leader>fe', ':FlutterEmulators<CR>')
    keymap.set('n', '<leader>fc', ':FlutterLogClear<CR>')
    keymap.set('n', '<leader>fo', ':FlutterOutlineToggle<CR>')
    keymap.set('n', '<leader>fq', ':FlutterQuit<CR>')
    keymap.set('n', '<leader>fr', ':FlutterRestart<CR>')
    keymap.set('n', '<leader>fR', ':FlutterReload<CR>')
    keymap.set('n', '<leader>fd', ':FlutterVisualDebug<CR>')
    keymap.set('n', '<leader>fC', ':lua require("telescope").extensions.flutter.commands()<CR>')
end

local load_telescope_extension = function()
    local status, telescope = pcall(require, 'telescope')
    if (not status) then return end
    telescope.load_extension('flutter')
end

local on_attach = function(client, bufnr)
    on_attach_lsp(client, bufnr)
    format_on_save(client, bufnr)
    set_key_map()
    load_telescope_extension()
end

flutter_tools.setup {
    ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = 'rounded',
    },
    decorations = {
        statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = false,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
        }
    },
    widget_guides = {
        enabled = false,
    },
    dev_log = {
        enabled = true,
        open_cmd = 'edit', -- command to use to open the log buffer
    },
    dev_tools = {
        autostart = false,         -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
    },
    outline = {
        open_cmd = '30vnew', -- command to use to open the outline buffer
        auto_open = false    -- if true this will open the outline automatically when it is first populated
    },
    lsp = {
        color = {                   -- show the derived colours for dart variables
            enabled = true,         -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true,      -- highlight the background
            foreground = true,      -- highlight the foreground
            virtual_text = true,    -- show the highlight using virtual text
            virtual_text_str = '■', -- the virtual text character to highlight
        },
        on_attach = on_attach,
        capabilities = capabilities, -- e.g. lsp_status capabilities
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            enableSnippets = true,
        }
    }
}
