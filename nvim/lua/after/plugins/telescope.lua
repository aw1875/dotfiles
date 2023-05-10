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
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
})

local map = require('utils').map
map('n', '<leader>ff', function()
    builtin.find_files({ prompt_prefix = '  ' })
end, {})
map('n', '<leader>fg', function()
    builtin.live_grep({ prompt_prefix = '  ' })
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
        cwd = '~/.dotfiles',
        prompt_title = 'Searching Dotfiles',
        search_dirs = { '~/.dotfiles', 'private' },
        file_ignore_patterns = { '%.git.*' }
    })
end, {})
map('n', '<leader>dl', builtin.diagnostics, { buffer = 0 })
map('n', '<leader>sr', builtin.lsp_references, {})
