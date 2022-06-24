Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers({ prompt_prefix = ' 📂️ ' })<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags({ prompt_prefix = ' ❓️ ' })<cr>
nnoremap <leader>fd :lua require('telescope.builtin').find_files({ prompt_prefix = ' 🖥️ ', cwd = '~/.dotfiles', prompt_title = 'Searching Dotfiles', search_dirs = { '~/.dotfiles', 'private' }, file_ignore_patterns = { '%.git.*' } })<cr>
nnoremap <leader>fi :lua require('telescope').extensions.media_files.media_files()<cr>
