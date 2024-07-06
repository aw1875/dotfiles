local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',

    -- Auto Snippets
    enable_autosnippets = true,

    -- ext options
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { ' Current Choice' } },
            },
        },
    },
    ext_base_prio = 300,
    ext_prio_increase = 1,
})

-- Snippets
require('utils.snips')
require('luasnip.loaders.from_vscode').lazy_load()
