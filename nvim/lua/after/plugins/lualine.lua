local icons = require('config.init').icons
local Util = require('utils')

require('lualine').setup({
    options = {
        theme = 'auto',
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
        component_separators = { left = '│', right = '│' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'branch', icon = { '' } },
            {
                'diff',
                symbols = {
                    added = icons.git.added,
                    modified = icons.git.modified,
                    removed = icons.git.removed,
                },
            },

        },
        lualine_c = {
            {
                'diagnostics',
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint,
                },
            },
            { 'filename', path = 1, symbols = { modified = '', readonly = '', unnamed = '[No Name]' } },
        },
        lualine_x = {
            { require('lazy.status').updates, cond = require('lazy.status').has_updates, color = Util.fg('Special') },
            {
                'filetype',
                icon_only = false,
                icon = { align = 'left' },
                padding = { left = 1, right = 1 },
            },
            {
                function() return icons.kinds.Copilot .. 'Copilot' end,
                cond = function()
                    local ok, clients = pcall(vim.lsp.get_active_clients, { name = 'copilot', bufnr = 0 })
                    return ok and #clients > 0
                end,
                color = { fg = '#98c379' }
            },
            {
                'fileformat',
                separator = '',
            },
            'encoding',
        },
        lualine_y = {
        },
        lualine_z = {
            { 'progress', separator = ' ',                  padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
        },
    },
    extensions = { 'neo-tree', 'lazy', 'fugitive' },
})
