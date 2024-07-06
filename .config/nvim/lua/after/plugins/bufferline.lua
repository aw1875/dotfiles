require('bufferline').setup({
    options = {
        numbers = 'none',
        close_command = function(n) require('mini.bufremove').delete(n, false) end,
        right_mouse_command = function(n) require('mini.bufremove').delete(n, false) end,
        left_mouse_command = 'buffer %d',
        middle_mouse_command = nil,

        -- Icons
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        -- Styling
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(_, _, diag)
            local icons = {
                Error = ' ',
                Warn = ' ',
                Hint = ' ',
                Info = ' ',
            }
            local ret = (diag.error and icons.Error .. diag.error .. ' ' or '')
                .. (diag.warning and icons.Warn .. diag.warning or '')
            return vim.trim(ret)
        end,
        offsets = {
            {
                filetype = 'neo-tree',
                text = 'File Explorer',
                text_align = 'center',
                highlight = 'Directory',
                separator = true
            }
        },
        color_icons = true,
        get_element_icon = function(element)
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
        end,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'thin',
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    },
    highlights = {
        fill = {
            bg = '#323442',
        },
        buffer_selected = {
            italic = false,
        }
    },
})
