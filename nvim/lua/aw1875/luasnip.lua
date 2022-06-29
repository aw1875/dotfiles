local luasnip = require('luasnip')
local types = require('luasnip.util.types')
luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
})
-- vim.keymap.set({ "i", "s" }, "<leader><leader>", function()
--   if luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   end 
-- end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
