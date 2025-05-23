-------------------------------------
-- Options and Keymaps
-------------------------------------
require('config.options')
require('config.keymaps')

-------------------------------------
-- VSCode Compatibility
-------------------------------------
if vim.g.vscode then
    vim.notify("Running in VSCode")
    require('config.vsc')
    return
end

-------------------------------------
-- Autogroups
-------------------------------------
require('config.autocmds')

-------------------------------------
-- Lazy
-------------------------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        { import = 'plugins' },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})

vim.cmd.colorscheme 'onedark'

-------------------------------------
-- Plugins
-------------------------------------
require('after.plugins')
