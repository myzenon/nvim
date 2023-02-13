-- LSP Confg
local lsp_config_status, nvim_lsp = pcall(require, 'lspconfig')
if (not lsp_config_status) then return end

-- LSP Signature
local lsp_signature_status, lsp_signature = pcall(require, 'lsp_signature')
if (not lsp_signature_status) then return end

-- LSP Format
local lsp_format_status, lsp_format = pcall(require, 'lsp-format')
if (not lsp_format_status) then return end

-- Variables
local protocol = require('vim.lsp.protocol')

-- Format function
local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Formatting
    require "lsp-format".on_attach(client)

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'E', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'ff', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)
end

--protocol.SymbolKind = { }
protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

-- Setting up vim diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

-- Disable show document on hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { focusable = false }
    )

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setting up languages server

-- Lua
nvim_lsp.lua_ls.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}

-- Typescript
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "json",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
    },
    init_options = {
        preferences = {
            quotePreference = 'single',
        },
    },
}

-- Docker
nvim_lsp.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Terraform
nvim_lsp.terraformls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- HTML
nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- CSS, SCSS, LESS
nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- CSS Modules (e.g, React)
nvim_lsp.cssmodules_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Stylelint (for formatting css)
nvim_lsp.stylelint_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Volar
-- nvim_lsp.volar.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { 'vue' },
--     -- filetypes = {'typescript', 'javascript', 'vue', 'json'},
--     -- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
-- }

-- Vue
nvim_lsp.vuels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'vue' },
}

-- Ruby
nvim_lsp.ruby_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Rust
require("rust-tools").setup {
    server = {
        -- on_attach = on_attach,
        on_attach = function(client, bufnr)
            local rust = require("rust-tools")
            -- Hover actions
            vim.keymap.set("n", "ha", rust.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "cga", rust.code_action_group.code_action_group, { buffer = bufnr })
            -- Runnables
            vim.keymap.set("n", "rr", rust.runnables.runnables, { buffer = bufnr })
            -- Parent Module
            vim.keymap.set("n", "rp", rust.parent_module.parent_module, { buffer = bufnr })
            -- Debuggables
            vim.keymap.set("n", "<leader>rd", rust.debuggables.debuggables, { buffer = bufnr })
            -- Open Cargo Toml
            vim.keymap.set("n", "<leader>rc", rust.open_cargo_toml.open_cargo_toml, { buffer = bufnr })
            on_attach(client, bufnr)
            enable_format_on_save(client, bufnr)
        end,
        capabilities = capabilities,
    },
}

-- Flutter
require("flutter-tools").setup {
    ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = "rounded",
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
        open_cmd = "edit", -- command to use to open the log buffer
    },
    dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
    },
    outline = {
        open_cmd = "30vnew", -- command to use to open the outline buffer
        auto_open = false -- if true this will open the outline automatically when it is first populated
    },
    lsp = {
        color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
        },
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            enable_format_on_save(client, bufnr)
        end,
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

-- ESLint
nvim_lsp.eslint.setup {
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    capabilities = capabilities
}

-- Diagnosticls
nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'pandoc' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    init_options = {
        -- linters = {
        -- eslint = {
        -- command = 'eslint_d',
        -- rootPatterns = { '.git' },
        -- debounce = 100,
        -- args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        -- sourceName = 'eslint_d',
        -- parseJson = {
        -- errorsRoot = '[0].messages',
        -- line = 'line',
        -- column = 'column',
        -- endLine = 'endLine',
        -- endColumn = 'endColumn',
        -- message = '[eslint] ${message} [${ruleId}]',
        -- security = 'severity'
        -- },
        -- securities = {
        -- [2] = 'error',
        -- [1] = 'warning',
        -- }
        -- },
        -- },
        -- filetypes = {
        -- javascript = 'eslint',
        -- javascriptreact = 'eslint',
        -- typescript = 'eslint',
        -- typescriptreact = 'eslint',
        -- },
        formatters = {
            eslint = {
                command = 'eslint_d',
                -- rootPatterns = { '.git' },
                args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
            },
            -- prettier = {
            -- command = 'prettier_d_slim',
            -- rootPatterns = { '.git' },
            -- requiredFiles: { 'prettier.config.js' },
            -- args = { '--stdin', '--stdin-filepath', '%filename' }
            -- }
        },
        formatFiletypes = {
            -- css = 'eslint',
            javascript = 'eslint',
            javascriptreact = 'eslint',
            -- json = 'eslint',
            -- scss = 'eslint',
            -- less = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
            -- json = 'eslint',
        }
    }
}
