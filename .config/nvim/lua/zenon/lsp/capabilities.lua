-- Set up completion using nvim_cmp with LSP source
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not status) then return end

local capabilities = cmp_nvim_lsp.default_capabilities()
return capabilities