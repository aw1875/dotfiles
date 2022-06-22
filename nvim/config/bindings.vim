"-----------------------------------
" General Bindings
"-----------------------------------
let mapleader = ' '

" Misc
map gf :edit <cfile><cr>

" Switching Tabs
nnoremap <C-e>     :bp<CR>
nnoremap <C-r>     :bn<CR>
nnoremap <C-w>     :bw<CR>

" NVIM Tree Bindings
nnoremap <leader>nn    :NvimTreeOpen<CR>
nnoremap <C-g>         :NvimTreeToggle<CR>
nnoremap <leader>n     :NvimTreeFocus<CR>
