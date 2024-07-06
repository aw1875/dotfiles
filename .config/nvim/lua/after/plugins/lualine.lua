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
        lualine_a = {
            {
                function()
                    if vim.g.devcontainer_name then
                        return "󱘖 " .. vim.g.devcontainer_name
                    else
                        return ""
                    end
                end,
                color = function()
                    if vim.g.devcontainer_name then
                        return { bg = '#56b6c2', fg = '#282c34' }
                    end
                end
            },
            'mode'
        },
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
            {
                function()
                    local recording = vim.fn.reg_recording()
                    local executing = vim.fn.reg_executing()

                    if recording ~= '' then
                        return 'Recording @' .. recording
                    elseif executing ~= '' then
                        return ' @' .. executing
                    else
                        return ""
                    end
                end,
                color = function()
                    if vim.fn.reg_recording() ~= '' then
                        return { fg = '#e06c75' }
                    elseif vim.fn.reg_executing() ~= '' then
                        return { fg = '#98c379' }
                    end
                end
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
                color = function()
                    local status = require("copilot.api").status.data

                    if status.status == 'InProgress' then
                        return { fg = '#56b6c2' }
                    elseif status.status == 'Warning' then
                        return { fg = '#d19a66' }
                    else
                        return { fg = '#98c379' }
                    end
                end
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
