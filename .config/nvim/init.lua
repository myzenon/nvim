require('zenon.variable')
require('zenon.keymap')
require('zenon.plugin')
require('zenon.setting')

local has = vim.fn.has
local is_mac = has 'macunix'
local is_win = has 'win32'

if is_mac then
    require('zenon.macos')
end
if is_win then
    require('zenon.windows')
end
