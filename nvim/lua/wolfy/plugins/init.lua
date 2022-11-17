vim.call('plug#begin', '~/.config/nvim/plugged')

-- Temp
local Plug = vim.fn['plug#']
Plug 'ThePrimeagen/vim-be-good'
Plug('dsznajder/vscode-es7-javascript-react-snippets', { ['do'] = 'yarn install --frozen-lockfile && yarn compile' })

require('wolfy.plugins.airline')
require('wolfy.plugins.dashboard-vim')
require('wolfy.plugins.markdown-preview')
require('wolfy.plugins.mason')
require('wolfy.plugins.nvim-cmp')
require('wolfy.plugins.nvim-lspconfig')
require('wolfy.plugins.nvim-tree')
require('wolfy.plugins.telescope')
require('wolfy.plugins.vim-commentary')
require('wolfy.plugins.vim-devicons')
require('wolfy.plugins.vim-fugitive')
require('wolfy.plugins.vim-gitgutter')
require('wolfy.plugins.vim-heritage')
require('wolfy.plugins.vim-lastplace')
require('wolfy.plugins.vim-one')
require('wolfy.plugins.vim-polyglot')
require('wolfy.plugins.vim-ripgrep')
require('wolfy.plugins.vim-visual-multi')
require('wolfy.plugins.which-key')

-- CS Tests
Plug 'aw1875/tests.nvim'

-- Local
Plug '~/Documents/dev/nvim-plugins/practice.nvim'

vim.call('plug#end')
