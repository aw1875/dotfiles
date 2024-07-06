return {
    -- Theme
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'onedark'
        end,
    },

    -- Buffer Line
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies =
        'nvim-tree/nvim-web-devicons'
    },

    -- Status Line
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- Colors
    {
        'NvChad/nvim-colorizer.lua',
        opts = {
            user_default_options = {
                tailwind = true,
            },
        },
    },
    {
        'roobert/tailwindcss-colorizer-cmp.nvim',
        config = true,
    },
}
