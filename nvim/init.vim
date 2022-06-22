"-----------------------------------
" Settings and Binding
"-----------------------------------
source ~/.config/nvim/config/sets.vim
source ~/.config/nvim/config/bindings.vim

"-----------------------------------
" Plugins
"-----------------------------------
call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc-tailwind-intellisence.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/es7-snippets.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vim-commentary.vim
source ~/.config/nvim/plugins/vim-heritage.vim
source ~/.config/nvim/plugins/vim-lastplace.vim
source ~/.config/nvim/plugins/vim-one.vim 
source ~/.config/nvim/plugins/vim-polyglot.vim
source ~/.config/nvim/plugins/vim-ripgrep.vim
source ~/.config/nvim/plugins/vim-visual-multi.vim
source ~/.config/nvim/plugins/which-key.vim

call plug#end()

"-----------------------------------
" Color Scheme
"-----------------------------------
colorscheme one
source ~/.config/nvim/themes/airline.vim

"-----------------------------------
" Lua Plugins 
"-----------------------------------
lua require('aw1875')

"-----------------------------------
" Prettier Auto Formatting
"-----------------------------------
augroup Format 
    autocmd!
    autocmd BufWritePre,InsertLeave * Prettier
augroup END
