return {
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-media-files.nvim',
        },
    },

    -- File Tree
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = 'Neotree',
        branch = 'v2.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        opts = {
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = 'open_current',
                filtered_items = {
                    hide_dotfiles = true,
                    hide_gitignored = false,
                    hide_hidden = false,
                }
            },
        },
    },

    -- Formatters
    {
        'sbdchd/neoformat',
        config = function()
            vim.g.neoformat_try_node_exe = 1
        end
    },

    -- Git Plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            signs = {
                add          = { text = '▎' },
                change       = { text = '▎' },
                delete       = { text = '▎' },
                topdelete    = { text = '▎' },
                changedelete = { text = '▎' },
                untracked    = { text = '▎' },
            },
            attach_to_untracked = false,
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 0,
                ignore_whitespace = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> • <summary>',
            current_line_blame_formatter_nc = 'You, <author_time:%R> • Uncommitted changes'
        },
    },

    -- Auto Pairs
    {
        'echasnovski/mini.pairs',
        event = 'VeryLazy',
        config = function(_, opts)
            require('mini.pairs').setup(opts)
        end,
    },

    -- Surround
    {
        'echasnovski/mini.surround',
        keys = function(_, keys)
            local plugin = require('lazy.core.config').spec.plugins['mini.surround']
            local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
            local mappings = {
                { opts.mappings.add,            desc = 'Add surrounding',                     mode = { 'n', 'v' } },
                { opts.mappings.delete,         desc = 'Delete surrounding' },
                { opts.mappings.find,           desc = 'Find right surrounding' },
                { opts.mappings.find_left,      desc = 'Find left surrounding' },
                { opts.mappings.highlight,      desc = 'Highlight surrounding' },
                { opts.mappings.replace,        desc = 'Replace surrounding' },
                { opts.mappings.update_n_lines, desc = 'Update `MiniSurround.config.n_lines`' },
            }
            mappings = vim.tbl_filter(function(m)
                return m[1] and #m[1] > 0
            end, mappings)
            return vim.list_extend(mappings, keys)
        end,
        opts = {
            mappings = {
                add = 'gza',
                delete = 'gzd',
                find = 'gzf',
                find_left = 'gzF',
                highlight = 'gzh',
                replace = 'gzr',
                update_n_lines = 'gzn',
            },
        },
        config = function(_, opts)
            require('mini.surround').setup(opts)
        end,
    },

    -- Comments
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {}
    },
    'tpope/vim-commentary',

    -- Diagnostics
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {}
    },

    -- Floating Command Line
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true
            },
        },
    },

    -- Undotree
    {
        'mbbill/undotree',
        config = function()
            require('utils').map('n', '<leader>u', function()
                vim.cmd.UndotreeToggle()
                vim.cmd.UndotreeFocus()
            end, { silent = true })
        end
    },

    -- Markdown Preview
    {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },

    -- Misc
    'jessarcher/vim-heritage',
    'farmergreg/vim-lastplace',
    'echasnovski/mini.bufremove',
    'folke/which-key.nvim',
    'mg979/vim-visual-multi',
}
