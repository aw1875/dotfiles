-------------------------------------
-- General Bindings
-------------------------------------
local map = require('utils').map

-- Open File
map('n', 'gf', '<cmd>e <cfile><CR>')

-- Source File
map('n', '<A-x>', '<cmd>so %<CR>')

-- Move Live
map('n', '<A-k>', ':m-2<CR>')
map('n', '<A-j>', ':m+<CR>')
map('i', '<A-k>', '<Esc>:m-2<CR> i')
map('i', '<A-j>', '<Esc>:m+<CR> i')
map('v', '<A-k>', ':m \'<-2<CR>gv=gv')
map('v', '<A-j>', ':m \'>+<CR>gv=gv')

-- Duplicate Line
map('n', '<A-S-Up>', 'yy <cmd>pu!<CR>')
map('i', '<A-S-Up>', '<Esc>yy <cmd>pu!<CR>')
map('v', '<A-S-Up>', 'y <cmd>pu!<CR>')
map('n', '<A-S-Down>', 'yy <cmd>pu<CR>')
map('i', '<A-S-Down>', '<Esc>yy <cmd>pu<CR>')
map('v', '<A-S-Down>', 'y <cmd>\'<,\'>pu<CR>')

-- JSON Formatting
map('n', '<leader>jp', '<cmd>.!jq .<CR>')
map('v', '<leader>jm', '<cmd>%!jq -c<CR>')

-- Switching Tabs
map('n', '<Tab>', '<cmd>bn<CR>')
map('n', '<S-Tab>', '<cmd>bp<CR>')
map('n', '<C-q>', '<cmd>bw<CR>')

-- NVIM Tree Bindings
map('n', '<leader>t', '<cmd>Neotree toggle<CR>')
map('n', '<leader>nf', '<cmd>Neotree focus<CR>')

-- Git
map('n', '<leader>gs', vim.cmd.Git)

return {
    map = map,
}
