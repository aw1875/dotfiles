local ok, cmp = pcall(require, 'cmp')
if not ok then
    require('notify')('CMP failed to load', 'error')
    return
end

local luasnip = require('luasnip')
local lspkind = require('lspkind')
local icons = require('config.init').icons

vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#98c379' })

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' })
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'tailwindcss' },
        {
            name = 'buffer',
            keyword_length = 5
        },
        { name = 'copilot', group_index = 2 },
    }),
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, vim_item)
            -- Temp Format with lspkind
            local kind = (function()
                local format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    symbol_map = icons.kinds,
                    before = require('tailwindcss-colorizer-cmp').formatter
                })

                return format(entry, vim_item)
            end)()

            -- Split icon and kind string
            local strings = vim.split(kind.kind, '%s', { trimempty = true })

            -- Set vim_item fields
            if #strings == 1 then
                vim_item.menu = icons.kinds.Color
                vim_item.kind = strings[1]
            else
                vim_item.menu = strings[1]
                vim_item.kind = strings[2]
                vim_item.menu_hl_group = 'CmpItemKind' .. strings[2]
            end

            return vim_item
        end
    },
    experimental = {
        ghost_text = true,
    }
})
