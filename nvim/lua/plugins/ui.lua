return {
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'rcarriga/nvim-notify',
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        }
    },

    -- Indent
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            char = '│',
            filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
            show_trailing_blankline_indent = false,
            show_current_context = true,
        },
    },
    {
        'echasnovski/mini.indentscope',
        version = false,
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            symbol = '│',
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
        config = function(_, opts)
            require('mini.indentscope').setup(opts)
            vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', {
                fg = '#61afef',
                nocombine = true,
            })
        end,
    },
}
