local loaded, nvim_cmp = pcall(require, "cmp")
if not loaded then
  return
end

local luasnip = require("luasnip")
local lspkind = require("lspkind")

nvim_cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = "symbol",
      preset = "codicons",
      maxwidth = 40,
      ellipsis_char = "...",
      before = function(_, vim_item)
        vim_item.menu = vim_item.kind
        return vim_item
      end
    }),
  },
  window = {
    completion = nvim_cmp.config.window.bordered(),
    documentation = nvim_cmp.config.window.bordered(),
  },
  mapping = nvim_cmp.mapping.preset.insert({
    ["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = nvim_cmp.mapping.complete(),
    ["<C-e>"] = nvim_cmp.mapping.abort(),
    ["<CR>"] = nvim_cmp.mapping.confirm({ select = true })
  }),
  sources = nvim_cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "tailwindcss" },
    { name = "vim-react-snippets" },
    { name = "buffer" },
  }),
})
