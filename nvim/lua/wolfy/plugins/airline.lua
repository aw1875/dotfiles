local Plug = vim.fn['plug#']
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

local g = vim.api.nvim_set_var
g('airline#extensions#tabline#formatter', 'clean')

vim.cmd([[
    let g:airline_extensions = ['branch', 'fugitiveline', 'term', 'tabline']
    let g:airline_powerline_fonts = 1
    let g:airline_skip_empty_sections = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.colnr = ' ℅:'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' :'
    let g:airline_symbols.maxlinenr = ' ☰ '
    let g:airline_symbols.dirty = ' ✚'
    let g:airline_symbols.notexists = ' ✖'
]])
