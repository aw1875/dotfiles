function! airline#extensions#tabline#formatters#clean#format(bufnr, buffers)
    return fnamemodify(bufname(a:bufnr), ':t')
endfunction
let g:airline#extensions#tabline#formatter = 'clean'
