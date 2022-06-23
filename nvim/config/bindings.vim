"-----------------------------------
" General Bindings
"-----------------------------------
let mapleader = ' '

" Misc
map gf :e <cfile><cr>
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> :m-2<CR>
inoremap <A-Up> :m+<CR>
nnoremap <A-S-Down> y'>p<CR>

" Switching Tabs
nnoremap <C-e>     :bp<CR>
nnoremap <C-r>     :bn<CR>
nnoremap <C-w>     :bw<CR>

" NVIM Tree Bindings
nnoremap <leader>nn    :NvimTreeOpen<CR>
nnoremap <C-g>         :NvimTreeToggle<CR>
nnoremap <leader>n     :NvimTreeFocus<CR>
