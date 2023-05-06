-------------------------------------
-- LSP Auto Formatting
-------------------------------------
local Format = vim.api.nvim_create_augroup('Format', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre *', {
    callback = function()
        local filetypes = { 'js', 'jsx', 'ts', 'tsx', 'css' }
        local current_filetype = vim.fn.expand('%:e')
        if not vim.tbl_contains(filetypes, current_filetype) then
            vim.lsp.buf.format()
        else
            vim.cmd('Neoformat')
        end
    end,
    group = Format,
})

-------------------------------------
-- TMUX Window Formatting
-------------------------------------
local TMUX = vim.api.nvim_create_augroup('TMUX', { clear = true })
vim.api.nvim_create_autocmd('BufEnter,BufReadPost,FileReadPost,BufNewFile *', {
    callback = function()
        local process = io.popen('tmux display-message -p \'#S\'')
        if (process ~= nil) then
            process = io.popen('tmux display-message -p \'#W\'')
            os.execute('tmux rename-window ' .. (vim.fn.expand('%:t') ~= '' and vim.fn.expand('%:t') or 'neovim'))
        end
    end,
    group = TMUX,
})
vim.api.nvim_create_autocmd('ExitPre *', {
    callback = function()
        os.execute('tmux rename-window zsh')
    end,
    group = TMUX,
})
