local status, packer = pcall(require, 'packer')
if (not status) then
    print('Packer is not installed')
    return
end

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    require('zenon.plugin.feature')
    require('zenon.plugin.lsp')
    require('zenon.plugin.magic')
    require('zenon.plugin.theme')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
