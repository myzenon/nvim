require('zenon.variable')
require('zenon.keymap')
require('zenon.plugin')
require('zenon.setting')

local has = vim.fn.has
local is_mac = has 'macunix'
local is_win = has 'win32'
local is_wsl = has 'wsl'

if is_mac then
    require('zenon.macos')
end
if is_win then
    require('zenon.windows')
end
if is_wsl then
    require('zenon.wsl')
end
