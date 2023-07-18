-------------------------------------
-- LSP Auto Formatting
-------------------------------------
local Format = vim.api.nvim_create_augroup('Format', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    pattern = '*',
    callback = function()
        -- Disabled filetypes
        local filetypes = { 'prisma' }

        -- Get current filetype
        local ft = vim.bo.filetype

        -- If filetype is in disabled table, format with lsp
        if vim.tbl_contains(filetypes, ft) then
            vim.lsp.buf.format()
            return
        end

        -- Search for pretter config file
        local prettier = vim.fs.find(
            { '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.yaml', '.prettierrc.json5',
                '.prettierrc.js', '.prettierrc.cjs', 'prettier.config.js', 'prettier.config.cjs', '.prettierrc.rc' }, {
                limit = 1,
                upwards = true,
                type = 'file',
                stop = vim.loop.os_homedir(),
            })

        -- If prettier config file is found, format with prettier
        if #prettier == 0 or prettier[1]:match('node_modules') then
            vim.lsp.buf.format()
        else
            vim.cmd('Neoformat')
        end
    end,
    group = Format,
})
