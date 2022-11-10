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
    ensure_installed = { 'tsserver', 'quick_lint_js', 'gopls', 'tailwindcss', 'clangd', 'pyright', 'jdtls', 'sumneko_lua' }
})
local servers = require('mason-lspconfig').get_installed_servers()

-- Add sourcekit to lsp
nvim_lsp.sourcekit.setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
}

for _, server in pairs(servers) do
    if server == 'sumneko_lua' then
        nvim_lsp[server].setup {
            on_attach = on_attach,
            single_file_support = true,
            capabilities = cmp_nvim_lsp.default_capabilities(),
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } }
                }
            }
        }
    else
        nvim_lsp[server].setup {
            on_attach = on_attach,
            single_file_support = true,
            capabilities = cmp_nvim_lsp.default_capabilities(),
        }
    end
end
