return {
    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
                config = true
            },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'j-hui/fidget.nvim',
                tag = 'legacy',
                opts = {}
            },
            {
                'folke/neodev.nvim',
                opts = { experimental = { pathStrict = true } }
            }
        },
    },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'onsails/lspkind-nvim' },

    -- Copilot
    {
        'zbirenbaum/copilot-cmp',
        dependencies = {
            'zbirenbaum/copilot.lua',
            cmd = 'Copilot',
            build = ':Copilot auth',
            opts = {
                suggestion = { enabled = false },
                panel = { enabled = false },
            },
        },
        opts = {},
        config = function(_, opts)
            local copilot_cmp = require('copilot_cmp')
            copilot_cmp.setup(opts)
            require('utils').on_attach(function(client)
                if client.name == 'copilot' then
                    copilot_cmp._on_insert_enter()
                end
            end)
        end,
    },


    {
        -- TreeSitter
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        }
    },
}
