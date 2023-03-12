local status, lsp_format = pcall(require, 'lsp-format')
if (not status) then return end

lsp_format.setup {}

-- local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })
local format_on_save = function(client, bufnr)
    -- This is old
    -- vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --     group = augroup_format,
    --     buffer = bufnr,
    --     callback = function()
    --         vim.lsp.buf.format({ bufnr = bufnr })
    --     end,
    -- })
    lsp_format.on_attach(client)
end

return format_on_save
