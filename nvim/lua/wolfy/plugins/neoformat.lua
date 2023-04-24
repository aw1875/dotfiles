local Plug = vim.fn['plug#']
Plug 'sbdchd/neoformat'

local g = vim.api.nvim_set_var
g('neoformat_try_node_exe', 1)
