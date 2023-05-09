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
        prompt_prefix = ' 🔍️ ',
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

-- Custom Setup for Telescope Buffers
local function buffers()
    builtin.buffers({ prompt_prefix = ' 📂️ ' })
end

-- Custom Setup for Telescope Help
local function help()
    builtin.help_tags({ prompt_prefix = ' ❓️ ' })
end

-- Custom Setup for Telescope Finding Dotfiles
local function dotfiles()
    builtin.find_files({
        prompt_prefix = ' 🖥️ ',
        cwd = '~/.dotfiles',
        prompt_title = 'Searching Dotfiles',
        search_dirs = { '~/.dotfiles', 'private' },
        file_ignore_patterns = { '%.git.*' }
    })
end

local map = require('utils').map
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', buffers, {})
map('n', '<leader>fh', help, {})
map('n', '<leader>fd', dotfiles, {})
map('n', '<leader>dl', builtin.diagnostics, { buffer = 0 })
map('n', '<leader>sr', builtin.lsp_references, {})
