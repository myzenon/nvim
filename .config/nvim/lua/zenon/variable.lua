-- Airline
vim.g['airline#extensions#tabline#enabled']= 1
vim.g.airline_powerline_fonts = 1

-- Move
vim.g.move_key_modifier = 'C'
vim.g.move_key_modifier_visualmode = 'C'

-- CamelCaseMotion
vim.g.camelcasemotion_key = '<leader>'

-- Split and join html
vim.g.splitjoin_html_attributes_bracket_on_new_line = 1

-- Mutli Cursor
vim.g.VM_maps = {
    ['Add Cursor Down'] = '<leader>j',   -- new cursor down
    ['Add Cursor Up'] = '<leader>k',   -- new cursor up
}