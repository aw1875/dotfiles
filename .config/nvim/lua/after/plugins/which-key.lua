require('which-key').setup({
    plugins = {
        marks = true,
        registers = false,
        spelling = {
            enabled = false,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    operators = { cc = 'Comments' },
    key_labels = {
        ['<leader>'] = '<space>',
    },
    icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '+',
    },
    popup_mappings = {
        scroll_down = '<c-d>',
        scroll_up = '<c-u>',
    },
    window = {
        border = 'shadow',
        position = 'bottom',
        margin = { 4, 0, 4, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 5,
        align = 'left',
    },
    ignore_missing = false,
    show_help = true,
    triggers = 'auto',
    triggers_blacklist = {
        i = { 'j', 'k' },
        v = { 'j', 'k' },
    },
})
