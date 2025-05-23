return {
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'rcarriga/nvim-notify',
        opts = {
            timeout = 3000,
            background_colour = '#282c34',
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
        main = "ibl",
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            indent = { char = '│' },
            exclude = { filetypes = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' } },
            whitespace = {
                remove_blankline_trail = false,
            },
            scope = { enabled = false },
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
