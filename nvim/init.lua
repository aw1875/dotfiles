-------------------------------------
-- Settings and Bindings
-------------------------------------
local sets, _ = pcall(require, 'wolfy.config.sets')
if not sets then
	print('Failed to load sets')
	return
end

local keybinds, _ = pcall(require, 'wolfy.config.keybinds')
if not keybinds then
	print('Failed to load keybinds')
	return
end
-------------------------------------
-- Globals
-------------------------------------
require('wolfy.globals')

-------------------------------------
-- Extra Functions
-------------------------------------
require('wolfy.extra')

-------------------------------------
-- Plugins
-------------------------------------
require('wolfy.plugins')

-------------------------------------
-- Set Color Scheme
-------------------------------------
require('wolfy.config.colorscheme')

-------------------------------------
-- Load Plugins After Setup
-------------------------------------
require('wolfy.after')

-------------------------------------
-- LSP Auto Formatting
-------------------------------------
local Format = vim.api.nvim_create_augroup("Format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre *", {
	callback = function()
		vim.lsp.buf.format()
	end,
	group = Format,
})
