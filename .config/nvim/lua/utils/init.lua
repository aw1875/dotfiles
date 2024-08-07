local extra = {}

function extra.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function extra.fg(name)
    ---@type {foreground?:number}?
    local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name }) or vim.api.nvim_get_hl_by_name(name, true)
    local fg = hl and hl.fg or hl.foreground
    return fg and { fg = string.format('#%06x', fg) }
end

function extra.on_attach(on_attach)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local buffer = args.buf or 0
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, buffer)
        end,
    })
end

local reload = function(name)
    local ok, plenary_reload = pcall(require, 'plenary.reload')
    if ok then
        return plenary_reload.reload_module(name)
    end

    return require(name)
end

function extra.reload(name)
    reload(name)
    return require(name)
end

function extra.reload_debug(name)
    reload(name)
    return require(name).setup({
        debug = true,
    })
end

P = function(v)
    print(vim.inspect(v))
    return v
end

return extra
