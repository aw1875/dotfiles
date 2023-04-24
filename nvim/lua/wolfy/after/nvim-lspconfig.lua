local loaded, nvim_lsp = pcall(require, 'lspconfig')
if not loaded then
    return
end

local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Create on attach keymaps
local map = require('wolfy.extra').map
local on_attach = function()
    map("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    map("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    map("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    map("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    map("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    map("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
end

-- Setup Mason
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'quick_lint_js', 'gopls', 'tailwindcss', 'clangd', 'pyright', 'jdtls', 'lua_ls',
        'prismals' }
})
local servers = require('mason-lspconfig').get_installed_servers()

-- Add sourcekit to lsp
-- nvim_lsp.sourcekit.setup {
--     on_attach = on_attach,
--     capabilities = cmp_nvim_lsp.default_capabilities(),
-- }

local omnisharp_bin = "/home/adamwolf/.cache/omnisharp-vim/omnisharp-roslyn/run"

nvim_lsp['omnisharp'].setup {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_dir = nvim_lsp.util.root_pattern("*.csproj", "*.sln"),
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
}

for _, server in pairs(servers) do
    if server == 'lua_ls' then
        nvim_lsp[server].setup {
            on_attach = on_attach,
            single_file_support = true,
            capabilities = cmp_nvim_lsp.default_capabilities(),
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim', 'P' } }
                }
            }
        }
    elseif server == "clangd" then
        nvim_lsp[server].setup {
            on_attach = on_attach,
            single_file_support = true,
            cmd = { "clangd", "--query-driver", "/usr/bin/g++" },
            capabilities = cmp_nvim_lsp.default_capabilities(),
        }
    elseif server == 'tailwindcss' then
        nvim_lsp[server].setup {
            on_attach = function(_, bufnr)
                on_attach()

                require("tailwindcss-colors").buf_attach(bufnr)
            end,
            single_file_support = true,
            capabilities = cmp_nvim_lsp.default_capabilities(),
        }
    else
        nvim_lsp[server].setup {
            on_attach = on_attach,
            single_file_support = true,
            capabilities = cmp_nvim_lsp.default_capabilities(),
        }
    end
end
