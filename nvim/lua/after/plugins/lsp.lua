local ok, lsp = pcall(require, 'lspconfig')
if not ok then
    require('notify')('LSP failed to load', 'error')
    return
end

-- LSP Config
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Create on attach keymaps
local map = require('utils').map
local on_attach = function()
    map('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    map('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
    map('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })
    map('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
    map('n', '<leader>dn', vim.diagnostic.goto_next, { buffer = 0 })
    map('n', '<leader>dp', vim.diagnostic.goto_prev, { buffer = 0 })
    map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
    map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
end

-- Diagnostics Settings
local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.opt.spelllang = { 'en_us' }

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        show_header = false,
        source = true,
        border = 'rounded',
        focusable = true,
    },
})

-- Custom Settings
local customSettings = {
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'P' }
            }
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
        },
        telementry = {
            enable = false,
        }
    },
    tailwindcss = {
        tailwindCSS = {
            includeLanguages = {
                markdown = 'html',
                handlebars = 'html',
                javascript = {
                    glimmer = 'javascript'
                },
                typescript = {
                    glimmer = 'javascript'
                }
            },
            classAttributes = { 'class', 'className', 'classList', 'ngClass' },
            lint = {
                cssConflict = 'warning',
                invalidApply = 'error',
                invalidConfigPath = 'error',
                invalidScreen = 'error',
                invalidTailwindDirective = 'error',
                invalidVariant = 'error',
                recommendedVariantOrder = 'warning'
            },
            validate = true
        }
    },
    tsserver = {
        maxTsServerMemory = 8000,
        implicitProjectConfig = {
            experimentalDecorators = true
        },
    },
    cssls = {
        css = {
            validate = true,
            lint = {
                unknownAtRules = 'ignore'
            },
        },
    }
}

local servers = {
    -- Languages
    'html',
    'cssls',
    'lua_ls',
    'tsserver',
    -- 'quick_lint_js',
    'bashls',
    'pyright',
    'gopls',
    'clangd',
    'jdtls',
    'jsonls',

    -- Frameworks
    'ember',
    'glint',

    -- Tools
    'tailwindcss',
    'prismals',
}

-- Setup Mason
require('mason').setup({
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗'
        }
    }
})
require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = false
})

-- Setup LSP
for _, serverName in ipairs(servers) do
    local server = lsp[serverName]

    if server then
        if serverName == 'clangd' then
            server.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = customSettings[serverName],
                cmd = { 'clangd', '--query-driver', '/usr/bin/g++' },
                single_file_support = true,
            })
            -- elseif serverName == 'tailwindcss' then
            --     server.setup({
            --         on_attach = on_attach,
            --         -- on_attach = function(_, bufnr)
            --         --     on_attach()
            --         --     require('tailwindcss-colors').buf_attach(bufnr)
            --         -- end,
            --         capabilities = capabilities,
            --         settings = customSettings[serverName]
            --     })
        elseif serverName == 'glint' then
            server.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = customSettings[serverName],
                -- root_dir = utils.is_glint_project,
            })
        else
            server.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = customSettings[serverName],
                single_file_support = true,
            })
        end
    end
end
