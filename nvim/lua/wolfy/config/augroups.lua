-------------------------------------
-- LSP Auto Formatting
-------------------------------------
local Format = vim.api.nvim_create_augroup("Format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre *", {
	callback = function()
		local filetypes = { "js", "jsx", "ts", "tsx", "css" }
		local current_filetype = vim.fn.expand("%:e")
		if not vim.tbl_contains(filetypes, current_filetype) then
			vim.lsp.buf.format()
		else
			vim.cmd("Neoformat")
		end
	end,
	group = Format,
})

-------------------------------------
-- TMUX Window Formatting
-------------------------------------
local TMUX = vim.api.nvim_create_augroup("TMUX", { clear = true })
local windowName = ""
vim.api.nvim_create_autocmd("BufReadPost,FileReadPost,BufNewFile *", {
	callback = function()
		local process = io.popen("tmux display-message -p \"#S\"")
		if (process ~= nil) then
			local sessionName = ""
			for line in process:lines() do
				sessionName = line
			end
			process = io.popen("tmux display-message -p \"#W\"")
			if (process ~= nil) then
				for line in process:lines() do
					windowName = line
				end
			end

			if (sessionName ~= "CS Homework") then
				os.execute("tmux rename-window " .. vim.fn.expand("%:t"))
			else
				local parent_folder = vim.fn.expand("%:p:h")
				local temp = {}

				for word in string.gmatch(parent_folder, "([^\\/]+)") do
					table.insert(temp, word)
				end

				local homework_number = temp[#temp + 1 - 2]
				os.execute("tmux rename-window '" .. homework_number .. " [" .. vim.fn.expand("%:t") .. "]'")
			end
		end
	end,
	group = TMUX,
})
vim.api.nvim_create_autocmd("ExitPre *", {
	callback = function()
		os.execute("tmux rename-window " .. windowName)
	end,
	group = TMUX,
})
