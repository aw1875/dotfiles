"-----------------------------------
" General Bindings
"-----------------------------------
let mapleader = ' '

" Open File
map gf :e <cfile><CR>

" Source File
nnoremap <A-x> :so %<CR>

" Move Line
nnoremap <A-k>      :m-2<CR>
nnoremap <A-j>      :m+<CR>
inoremap <A-k> <Esc>:m-2<CR> i
inoremap <A-j> <Esc>:m+<CR> i

" Duplicate Line
nnoremap <A-S-Up> yy        :pu!<CR>
inoremap <A-S-Up> <Esc>yy   :pu!<CR>
vnoremap <A-S-Up> y         :pu!<CR>
nnoremap <A-S-Down> yy      :pu<CR>
inoremap <A-S-Down> <Esc>yy :pu<CR>
vnoremap <A-S-Down> y       :'<,'>pu<CR>

" JSON Formatting
nnoremap <leader>jp :.!jq .<CR>
vnoremap <leader>jm :%!jq -c<CR>

" Auto close
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" Switching Tabs
nnoremap <C-e> :bp<CR>
nnoremap <S-Tab> :bn<CR>
nnoremap <C-q> :bw<CR>

" NVIM Tree Bindings
nnoremap <leader>nn :NvimTreeOpen<CR>
nnoremap <leader>t  :NvimTreeToggle<CR>
nnoremap <leader>nf  :NvimTreeFocus<CR>

" FloatTerm Bindings
nnoremap <leader>tn :FloatermNew<CR>
nnoremap <leader>tt :FloatermToggle<CR>
nnoremap <leader>tr :FloatermNew --position=rightbelow --width=0.35 --wintype=vsplit<CR>
