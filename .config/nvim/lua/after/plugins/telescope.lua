local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')

-- Setup Telescope
telescope.setup({
    defaults = {
        layout_strategy = 'flex',
        mappings = {
            n = {
                ['q'] = actions.close
            }
        },
        color_devicons = true,
        previewer = true,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        file_ignore_patterns = { '%.git/.*', 'node%_modules/.*', 'zig%-cache/.*' },
    },
    pickers = {
        find_files = { hidden = true },
        live_grep = { additional_args = { '--hidden' } },
    },
})

local map = require('utils').map
map('n', '<leader>ff', function()
    builtin.find_files({ prompt_prefix = '  ' })
end, {})
map('n', '<leader>fg', function()
    builtin.live_grep({ prompt_prefix = '  ', })
end, {})
map('n', '<leader>fb', function()
    builtin.buffers({ prompt_prefix = '  ' })
end, {})
map('n', '<leader>fh', function()
    builtin.help_tags({ prompt_prefix = ' 󰞋 ' })
end, {})
map('n', '<leader>fd', function()
    builtin.find_files({
        prompt_prefix = '  ',
        cwd = '~/dotfiles',
        prompt_title = 'Searching Dotfiles',
        search_dirs = { '~/dotfiles' },
        file_ignore_patterns = { '%.git.*' }
    })
end, {})
map('n', '<leader>of', function()
    builtin.oldfiles({
        prompt_prefix = '  ',
        prompt_title = 'Searching Old Files',
        file_ignore_patterns = { '%.git.*' }
    })
end, {})
map('n', '<leader>dl', function()
    builtin.diagnostics({
        prompt_prefix = '  ',
        prompt_title = 'Diagnostics',
        bufnr = 0,
    })
end)
map('n', '<leader>sr', builtin.lsp_references, {})
map('n', '<leader>bg', function()
    builtin.current_buffer_fuzzy_find({
        prompt_prefix = '  ',
        prompt_title = 'Current Buffer'
    })
end)
