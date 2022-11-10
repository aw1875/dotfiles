-------------------------------------
-- General Bindings
-------------------------------------
vim.g.mapleader = ' '

local map = require('wolfy.extra').map

-- Open File
map('n', 'gf', ':e <cfile><CR>')

-- Source File
map('n', '<A-x>', ':so %<CR> :echo "Reloaded Config"<CR>')

-- Move Live
map('n', '<A-k>', ':m-2<CR>')
map('n', '<A-j>', ':m+<CR>')
map('i', '<A-k>', '<Esc>:m-2<CR> i')
map('i', '<A-j>', '<Esc>:m+<CR> i')
map('v', '<A-k>', ':m \'>+<CR>gv=gv')
map('v', '<A-j>', ':m \'<-2<CR>gv=gv')

-- Duplicate Line
map('n', '<A-S-Up>', 'yy :pu!<CR>')
map('i', '<A-S-Up>', '<Esc>yy :pu!<CR>')
map('v', '<A-S-Up>', 'y :pu!<CR>')
map('n', '<A-S-Down>', 'yy :pu<CR>')
map('i', '<A-S-Down>', '<Esc>yy :pu<CR>')
map('v', '<A-S-Down>', 'y :\'<,\'>pu<CR>')

-- JSON Formatting
map('n', '<leader>jp', ':.!jq .<CR>')
map('v', '<leader>jm', ':%!jq -c<CR>')

-- Auto Close
map('i', '(', '()<Left>')
map('i', '[', '[]<Left>')
map('i', '{', '{}<Left>')
map('i', '\'', '\'\'<Left>')
map('i', '\"', '\"\"<Left>')

-- Switching Tabs
map('n', '<C-e>', ':bp<CR>')
map('n', '<S-Tab>', ':bn<CR>')
map('n', '<C-q>', ':bw<CR>')

-- NVIM Tree Bindings
map('n', '<leader>nn', ':NvimTreeOpen<CR>')
map('n', '<leader>t', ':NvimTreeToggle<CR>')
map('n', '<leader>nf', ':NvimTreeFocus<CR>')

-- TestCases Bindings
map('n', '<leader>tc', ':TestCases<CR>')

return {
  map = map,
  test = test
}
