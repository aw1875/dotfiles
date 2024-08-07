-------------------------------------
-- LSP Auto Formatting
-------------------------------------
local Format = vim.api.nvim_create_augroup("Format", { clear = true })
local skip_patterns = { "Travefy", "ghost%-cursor", "wireguard%-tools" }
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    callback = function()
        -- Check if path matches any skip patterns
        local path = vim.fn.expand("%:p")
        for _, pattern in ipairs(skip_patterns) do
            if path:match(pattern) then
                vim.notify("Formatting disabled for " .. pattern:gsub("%%", ""), vim.log.levels.INFO,
                    { title = "neovim" })
                return
            end
        end

        -- Disabled filetypes
        local filetypes = { "prisma" }

        -- Get current filetype
        local ft = vim.bo.filetype

        -- If filetype is in disabled table, format with lsp
        if vim.tbl_contains(filetypes, ft) then
            vim.lsp.buf.format()
            return
        end

        -- Search for pretter config file
        local prettier = vim.fs.find({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            ".prettierrc.rc",
        }, {
            limit = 1,
            upwards = true,
            type = "file",
            stop = vim.loop.os_homedir(),
        })

        -- If prettier config file is found, format with prettier
        if #prettier == 0 or prettier[1]:match("node_modules") then
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
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile", "VimLeave" }, {
    pattern = "*",
    callback = function(ev)
        -- On exit reset name back to zsh
        if ev.event == "VimLeave" then
            os.execute("tmux rename-window zsh")
            return
        end

        -- Extendable ignored filetypes
        local ignored_filetypes = { "", "TelescopePrompt", "neo-tree" }

        -- If filetype is not ignored, rename tmux window to current file
        if vim.bo.filetype ~= nil and not vim.tbl_contains(ignored_filetypes, vim.bo.filetype) then
            local file = vim.fn.expand("%:t")
            os.execute("tmux rename-window " .. (file ~= "" and file or "neovim"))
        end
    end,
    group = TMUX,
})

-------------------------------------
-- Zig build.zig.zon filetype
-------------------------------------
local Zig = vim.api.nvim_create_augroup("Zig", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile", "BufRead" }, {
    pattern = "*.zig.zon",
    callback = function()
        vim.bo.filetype = "zig"
    end,
    group = Zig,
})
