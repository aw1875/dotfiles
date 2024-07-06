-------------------------------------
-- General Bindings
-------------------------------------
local utils = require('utils')
local map = utils.map

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
map('n', '<leader>gb', function()
    require('gitsigns').blame_line { full = true }
end)
map({ 'n', 'v' }, '<leader>hs', function()
    if vim.fn.mode == 'v' then
        require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
    else
        require('gitsigns').stage_hunk()
    end
end)
map({ 'n', 'v' }, '<leader>hr', function()
    if vim.fn.mode == 'v' then
        require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
    else
        require('gitsigns').reset_hunk()
    end
end)
map({ 'n', 'v' }, '<leader>hu', function()
    if vim.fn.mode == 'v' then
        require('gitsigns').undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
    else
        require('gitsigns').undo_stage_hunk()
    end
end)
map({ 'n', 'v' }, '<leader>hp', function()
    if vim.fn.mode == 'v' then
        require('gitsigns').preview_hunk_inline { vim.fn.line('.'), vim.fn.line('v') }
    else
        require('gitsigns').preview_hunk_inline()
    end
end)

-- Git Navigating
map('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function()
        require('gitsigns').next_hunk()
    end)
    return '<Ignore>'
end, { expr = true })

map('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function()
        require('gitsigns').prev_hunk()
    end)
    return '<Ignore>'
end, { expr = true })

-- TestCases Bindings
map('n', '<leader>tc', ':Tests<CR>')

-- Dev
map('n', '<leader>to', ':new<CR>:term<CR>')
map('n', '<leader>,,', function()
    utils.reload_debug('cl')
end)

-- TSPlayground
map('n', '<leader>tsp', '<cmd>InspectTree<CR>')

return {
    map = map,
}
