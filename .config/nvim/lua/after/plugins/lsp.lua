-- LSP Config
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Create on attach keymaps
local map = require('utils').map
local on_attach = function()
    map('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    map('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
    map('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })
    map('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
    map('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>', { buffer = 0 })
    map('n', '<leader>dn', function() vim.diagnostic.jump({ count = 1 }) end, { buffer = 0 })
    map('n', '<leader>dp', function() vim.diagnostic.jump({ count = -1 }) end, { buffer = 0 })
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

vim.opt.spelllang = { 'en_us' }

vim.diagnostic.config({
    virtual_lines = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.INFO] = signs.Info,
            [vim.diagnostic.severity.HINT] = signs.Hint,
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticsSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticsSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticsSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticsSignHint',
        },
    },
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
                globals = { 'vim', 'P' },
                disable = { 'missing-fields' }
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
            validate = true,
            experimental = {
                classRegex = {
                    { "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                }
            }
        }
    },
    ts_ls = {
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
    },
}

local servers = {
    -- Languages
    'html',
    'cssls',
    'lua_ls',
    'ts_ls',
    'bashls',
    'pyright',
    -- 'gopls',
    -- 'clangd',
    'jsonls',
    -- 'rust_analyzer',

    -- Frameworks
    'sqlls',

    -- Tools
    'tailwindcss',
    'prismals',
    'dockerls',
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
    -- if serverName == 'clangd' then
    --     server.setup({
    --         on_attach = on_attach,
    --         capabilities = capabilities,
    --         settings = customSettings[serverName],
    --         cmd = { 'clangd', '--query-driver', '/usr/bin/g++' },
    --         single_file_support = true,
    --     })

    if serverName == 'ts_ls' then
        vim.lsp.config(serverName, {
            on_attach = function()
                on_attach()

                if vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(true)
                end
            end,
            capabilities = capabilities,
            settings = customSettings.ts_ls,
            single_file_support = true,
            init_options = {
                preferences = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParamaterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                    importModuleSpecifierPreference = 'relative',
                }
            },
        })
    else
        vim.lsp.config(serverName, {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = customSettings[serverName],
            single_file_support = true,
        })
    end
end
