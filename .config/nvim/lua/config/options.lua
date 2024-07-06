vim.cmd([[set t_Co=256]])

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.completeopt = 'menu,menuone,noselect'
opt.hidden = true
opt.wrap = false
opt.swapfile = false
opt.encoding = 'utf-8'
opt.pumheight = 10
opt.fileencoding = 'utf-8'
opt.ruler = true
opt.cmdheight = 1
opt.iskeyword:append('-')
opt.mouse = 'a'
opt.splitbelow = true
opt.splitright = true
opt.showtabline = 2
opt.conceallevel = 0
opt.tabstop = 4
opt.softtabstop = 4
opt.hlsearch = false
opt.errorbells = false
opt.smarttab = true
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.relativenumber = true
opt.scrolloff = 8
opt.laststatus = 0
opt.number = true
opt.cursorline = true
opt.background = 'dark'
opt.showmode = false
opt.backup = false
opt.writebackup = false
opt.shortmess:append('c')
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.updatetime = 300
opt.timeoutlen = 300
opt.redrawtime = 10000
opt.formatoptions:remove('cro')
opt.foldmethod = 'manual'
opt.clipboard:append('unnamedplus')
