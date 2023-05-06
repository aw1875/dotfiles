vim.cmd([[
    let g:user_emmet_expandabbr_key='<Tab>'
    imap <silent> <expr> <Tab> emmet#expandAbbrIntelligent('\<tab>')
]])
