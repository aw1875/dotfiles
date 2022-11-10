local loaded, nvim_cmp = pcall(require, 'cmp')
if not loaded then
    return
end

local luasnip = require('luasnip')
local lspkind = require('lspkind')
local icons = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Constant = '',
    Class = '',
    Interface = 'ﰮ',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '了',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constructor = '',
    Struct = '',
    Event = '',
    Operator = 'ﬦ',
    TypeParameter = '',
}

nvim_cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "menu", "abbr", "kind" },

    format = function(entry, item)
      item.menu = string.format("%s", icons[item.kind])
      item.kind = string.format("       (%s)  ", item.kind)
      return item
    end
  },
  window = {
    documentation = nvim_cmp.config.window.bordered(),
  },
  mapping = nvim_cmp.mapping.preset.insert({
    ['<C-b>'] = nvim_cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = nvim_cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = nvim_cmp.mapping.complete(),
    ['<C-e>'] = nvim_cmp.mapping.abort(),
    ['<CR>'] = nvim_cmp.mapping.confirm({ select = true })
  }),
  sources = nvim_cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'tailwindcss'},
    { name = 'vim-react-snippets'},
    { name = 'buffer' },
  }),
})
