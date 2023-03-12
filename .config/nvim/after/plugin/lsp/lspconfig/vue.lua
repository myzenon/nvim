local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
local status, nvim_lsp_configs = pcall(require, 'lspconfig.configs')
if (not status) then return end
local status, nvim_lsp_util = pcall(require, 'lspconfig.util')
if (not status) then return end

local on_attach_lsp = require('zenon.lsp.on_attach')
-- local format_on_save = require('zenon.lsp.format_on_save')
local capabilities = require('zenon.lsp.capabilities')

-- local on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = false
--     if client.name == 'volar_api' then
--         on_attach_lsp(client, bufnr)
--     end
--     -- format_on_save(client, bufnr)
-- end

-- local function on_new_config(new_config, new_root_dir)
--     local function get_typescript_server_path(root_dir)
--         local project_root = nvim_lsp_util.find_node_modules_ancestor(root_dir)
--         return project_root and
--             (nvim_lsp_util.path.join(project_root, 'node_modules', 'typescript', 'lib'))
--             or ''
--     end

--     if
--         new_config.init_options
--         and new_config.init_options.typescript
--         and new_config.init_options.typescript.tsdk == ''
--     then
--         new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
--     end
-- end

-- local volar_cmd = { 'vue-language-server', '--stdio' }
-- local volar_root_dir = nvim_lsp_util.root_pattern 'package.json'

-- nvim_lsp_configs.volar_api = {
--     default_config = {
--         cmd = volar_cmd,
--         root_dir = volar_root_dir,
--         on_new_config = on_new_config,
--         filetypes = { 'vue' },
--         -- If you want to use Volar's Take Over Mode (if you know, you know)
--         --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
--         init_options = {
--             typescript = {
--                 tsdk = ''
--             },
--             languageFeatures = {
--                 implementation = true, -- new in @volar/vue-language-server v0.33
--                 references = true,
--                 definition = true,
--                 typeDefinition = true,
--                 callHierarchy = true,
--                 hover = true,
--                 rename = true,
--                 renameFileRefactoring = true,
--                 signatureHelp = true,
--                 codeAction = true,
--                 workspaceSymbol = true,
--                 completion = {
--                     defaultTagNameCase = 'both',
--                     defaultAttrNameCase = 'kebabCase',
--                     getDocumentNameCasesRequest = false,
--                     getDocumentSelectionRequest = false,
--                 },
--             }
--         },
--     }
-- }
-- nvim_lsp.volar_api.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }

-- nvim_lsp_configs.volar_doc = {
--     default_config = {
--         cmd = volar_cmd,
--         root_dir = volar_root_dir,
--         on_new_config = on_new_config,
--         filetypes = { 'vue' },
--         -- If you want to use Volar's Take Over Mode (if you know, you know):
--         --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
--         init_options = {
--             typescript = {
--                 tsdk = ''
--             },
--             languageFeatures = {
--                 implementation = true, -- new in @volar/vue-language-server v0.33
--                 documentHighlight = true,
--                 documentLink = true,
--                 codeLens = { showReferencesNotification = true },
--                 -- not supported - https://github.com/neovim/neovim/pull/15723
--                 semanticTokens = false,
--                 diagnostics = true,
--                 schemaRequestService = true,
--             }
--         },
--     }
-- }
-- nvim_lsp.volar_doc.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }

-- nvim_lsp_configs.volar_html = {
--     default_config = {
--         cmd = volar_cmd,
--         root_dir = volar_root_dir,
--         on_new_config = on_new_config,
--         filetypes = { 'vue' },
--         -- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
--         --filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
--         init_options = {
--             typescript = {
--                 tsdk = ''
--             },
--             documentFeatures = {
--                 selectionRange = true,
--                 foldingRange = true,
--                 linkedEditingRange = true,
--                 documentSymbol = true,
--                 -- not supported - https://github.com/neovim/neovim/pull/13654
--                 documentColor = false,
--                 documentFormatting = {
--                     defaultPrintWidth = 100,
--                 },
--             },
--         },
--     }
-- }
-- nvim_lsp.volar_html.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }

nvim_lsp.volar.setup({
    on_attach = function(client, bufnr)
        on_attach_lsp(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
    end,
    capabilities = capabilities
})