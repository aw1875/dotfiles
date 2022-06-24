"-----------------------------------
" General Bindings
"-----------------------------------
let mapleader = ' '

" Open File
map gf :e <cfile><cr>

" Move Line
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> :m-2<CR>
inoremap <A-Up> :m+<CR>

" Duplicate Line
nnoremap <A-S-Up> yy :pu!<CR>
inoremap <A-S-Up> <Esc>yy :pu!<CR>
vnoremap <A-S-Up> y :pu!<CR>
nnoremap <A-S-Down> yy :pu<CR>
inoremap <A-S-Down> <Esc>yy :pu<CR>
vnoremap <A-S-Down> y :'<,'>pu<CR>

" Auto close [] and {}
inoremap [ [<CR><CR>]<Up><Tab>
inoremap { {<CR><CR>}<Up><Tab>

" Switching Tabs
nnoremap <C-e>     :bp<CR>
nnoremap <C-r>     :bn<CR>
nnoremap <C-w>     :bw<CR>

" NVIM Tree Bindings
nnoremap <leader>nn    :NvimTreeOpen<CR>
nnoremap <C-g>         :NvimTreeToggle<CR>
nnoremap <leader>n     :NvimTreeFocus<CR>
