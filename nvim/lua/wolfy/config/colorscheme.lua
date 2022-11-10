local loaded, _ = pcall(vim.cmd, 'colorscheme one')
if not loaded then
	print('Theme not loaded')
end
