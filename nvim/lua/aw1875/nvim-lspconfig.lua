local loaded, nvim_lsp = pcall(require, 'lspconfig')
if not loaded then
    return
end

local nvim_lsp = require('lspconfig')

local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dl", "<CMD>Telescope diagnostics<CR>", { buffer = 0 })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set("n", "<leader>sr", "<CMD>Telescope lsp_references<CR>", { buffer = 0 })
end


local servers = { 'tsserver', 'tailwindcss', 'clangd', 'sourcekit' }
for _, server in pairs(servers) do
    if server == clangd then
        nvim_lsp[server].setup {
            on_attach = on_attach,
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
            root_pattern = (
                'compile_commands.json'
            )
        }
    else
        nvim_lsp[server].setup {
            on_attach = on_attach,
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        }
    end
end
