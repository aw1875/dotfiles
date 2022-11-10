vim.g.dashboard_default_excutive = 'telescope'

local db = require('dashboard')
db.preview_command = 'cat | lolcat -S 2'
db.preview_file_path = '~/.config/nvim/static/wolfy.cat'
db.preview_file_height = 13
db.preview_file_width = 44
db.custom_center = {
    { icon = '  ',
        desc = 'Recently opened files                  ',
        action = 'DashboardFindHistory',
        shortcut = 'SPC f h' },
    { icon = '  ',
        desc = 'Find File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'SPC f f' },
    { icon = '  ',
        desc = 'Find Buffer                            ',
        action = 'Telescope file_browser',
        shortcut = 'SPC f b' },
    { icon = '  ',
        desc = 'Find Word                              ',
        action = 'Telescope live_grep',
        shortcut = 'SPC f g' },
    { icon = '  ',
        desc = 'Search Personal Dotfiles               ',
        action = 'Telescope dotfiles path=~/.dotfiles',
        shortcut = 'SPC f d' },
}
db.custom_footer = { "" }