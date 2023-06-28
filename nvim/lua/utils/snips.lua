local ls = require('luasnip')
local s, i, f = ls.snippet, ls.insert_node, ls.function_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets('lua', {
    s('req', fmt([[local {} = require('{}'){}]], {
        f(function(import)
            local import_parts = vim.split(import[1][1], '.', true)
            return import_parts[#import_parts] or ''
        end, { 1 }),
        i(1),
        i(0)
    })),
    s('lf', fmt([[
    local function {}({})
        {}
    end
    ]], {
        i(1),
        i(2),
        i(0),
    })),
    s('mf', fmt([[
    function M.{}({})
        {}
    end
    ]], {
        i(1),
        i(2),
        i(0),
    })),
    s('cf', fmt([[
    function {}:{}({})
        {}
    end
    ]], {
        i(1),
        i(2),
        i(3),
        i(0),
    })),
    s('class', fmt([[
    local {} = {{}}
    {}.__index = {}

    function {}.new({})
        {}
    end

    return {}
    ]], {
        i(1),
        rep(1),
        rep(1),
        rep(1),
        i(2),
        i(0),
        rep(1)
    })),
    s('exm', fmt([[
    local M = {{}}

    function M.{}({})
        {}
    end

    return M
    ]], {
        i(1),
        i(2),
        i(0),
    })),
})

ls.add_snippets('typescriptreact', {
    s('tcc', fmt([[
    'use client';

    interface {}Props {{
        {}
    }}

    const {}: React.FC<{}Props> = ({{ {} }}) => {{
        return (
            <div>{}</div>
        );
    }}

    export default {};]], {
        i(1),
        i(2),
        rep(1),
        rep(1),
        f(function(args)
            local lines = {}
            for _, line in ipairs(args[1]) do
                local parts = vim.split(line, ':', { trimempty = true })
                if #parts ~= 0 then
                    lines[#lines + 1] = parts[1]:gsub('%s+', ''):gsub('?', ''):gsub(';', '')
                end
            end
            return table.concat(lines, ', ')
        end, { 2 }),
        i(3),
        rep(1)
    })),
})
