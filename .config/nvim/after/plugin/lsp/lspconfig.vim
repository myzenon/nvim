if !exists('g:lspconfig') && !exists('g:mason') && !exists('g:mason-lspconfig')
  finish
endif

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
require("lsp_signature").setup()
require('aerial').setup({})
require "lsp-format".setup {
    dart = { tab_width = 2 },
}
--vim.lsp.set_log_level("debug")
EOF

lua << EOF
local nvim_command = vim.api.nvim_command
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require("aerial").on_attach(client, bufnr)
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'E', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'ff', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)

  -- formatting
  require "lsp-format".on_attach(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
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
end


-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

-- Volar
nvim_lsp.volar.setup {
    on_attach = on_attach,
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    capabilities = capabilities,
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

-- CSS
nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- CSS Modules
nvim_lsp.cssmodules_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- ESLint
nvim_lsp.eslint.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

-- Diagnosticls
--nvim_lsp.diagnosticls.setup {
--  on_attach = on_attach,
--  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'pandoc' },
--  init_options = {
--    linters = {
--      eslint = {
--        command = 'eslint_d',
--        rootPatterns = { '.git' },
--        debounce = 100,
--        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--        sourceName = 'eslint_d',
--        parseJson = {
--          errorsRoot = '[0].messages',
--          line = 'line',
--          column = 'column',
--          endLine = 'endLine',
--          endColumn = 'endColumn',
--          message = '[eslint] ${message} [${ruleId}]',
--          security = 'severity'
--        },
--        securities = {
--          [2] = 'error',
--          [1] = 'warning'
--        }
--      },
--    },
--    filetypes = {
--      javascript = 'eslint',
--      javascriptreact = 'eslint',
--      typescript = 'eslint',
--      typescriptreact = 'eslint',
--    formatters = {
--    },
--      eslint_d = {
--        command = 'eslint_d',
--        rootPatterns = { '.git' },
--        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--        rootPatterns = { '.git' },
--      },
--      prettier = {
--        command = 'prettier_d_slim',
--        rootPatterns = { '.git' },
--        -- requiredFiles: { 'prettier.config.js' },
--        args = { '--stdin', '--stdin-filepath', '%filename' }
--      }
--    },
--    formatFiletypes = {
--      css = 'prettier',
--      javascript = 'prettier',
--      javascriptreact = 'prettier',
--      json = 'prettier',
--      scss = 'prettier',
--      less = 'prettier',
--      typescript = 'prettier',
--      typescriptreact = 'prettier',
--      json = 'prettier',
--    }
--  }
--}

-- Icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    }
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

-- Hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

-- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
-- vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
-- vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
-- vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
-- vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
-- vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
-- vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

EOF

" augroup lsp
"     autocmd!
"     autocmd CursorHold * lua vim.diagnostic.open_float()
" augroup END
