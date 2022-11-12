-------------------------------------
-- Settings
-------------------------------------
vim.cmd([[
set t_Co=256
set completeopt=menuone,noinsert,noselect
]])

vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"
vim.opt.pumheight = 10
vim.opt.fileencoding = "utf-8"
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.iskeyword:append("-")
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 2
vim.opt.conceallevel = 0
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.hlsearch = false
vim.opt.errorbells = false
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.redrawtime = 10000
vim.opt.formatoptions:remove("cro")
vim.opt.foldmethod = "manual"
vim.opt.clipboard:append("unnamedplus")
vim.opt.laststatus = 3
