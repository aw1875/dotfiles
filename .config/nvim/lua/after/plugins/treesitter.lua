local languages = {
    'bash',
    'c',
    'c_sharp',
    'comment',
    'cpp',
    'css',
    'glimmer',
    'html',
    'javascript',
    'lua',
    'prisma',
    'python',
    'tsx',
    'typescript',
    'vimdoc'
}

require('nvim-treesitter.configs').setup({
    ensure_installed = languages,
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
