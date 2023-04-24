local Plug = vim.fn['plug#']
Plug 'OmniSharp/omnisharp-vim'
vim.cmd([[
    let g:OmniSharp_server_stdio = 1
]])
