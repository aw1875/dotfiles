local ls = require('luasnip')
local s, i, f, c = ls.snippet, ls.insert_node, ls.function_node, ls.choice_node

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
    M.{} = function({})
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

    M.{} = function({})
        {}
    end

    return M
    ]], {
        i(1),
        i(2),
        i(0),
    })),
    s('exg', fmt([[
    local <> = {}

    function <>.<>(<>)
        <>
    end

    _G.<> = <>

    return <>
    ]], {
        i(1),
        rep(1),
        i(2),
        i(3),
        i(0),
        rep(1),
        rep(1),
        rep(1),
    }, {
        delimiters = "<>"
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

    s('tfc', fmt([[
    'use client';

    const [] = () => {
        return (
        []
        );
    }

    export default [];]], {
        i(1),
        i(0),
        rep(1),
    }, {
        delimiters = "[]"
    })),
})

ls.add_snippets('zig', {
    s({ trig = "str", name = "Struct", dscr = "struct helper" }, fmt([[
        pub const <> = struct {
            <>

            pub fn init(<>) <> {
                return .{
                    <>
                };
            }<>
        };<>
        ]], {
            i(1),
            i(2),
            f(function(args)
                local lines = {}
                for _, line in ipairs(args[1]) do
                    if not (line:match("^(//+)/(.+)") or line:match("^%s*$")) then
                        lines[#lines + 1] = line:gsub('^%s+', ''):gsub(',', '')
                    end
                end
                return table.concat(lines, ', ')
            end, { 2 }),
            rep(1),
            f(function(args)
                local lines = {}
                for _, line in ipairs(args[1]) do
                    if not (line:match("^//+") or line:match("^%s*$")) then
                        local parts = vim.split(line, ':', { trimempty = true })
                        if #parts > 0 then
                            local var = parts[1]:match("^%s*(.-)%s*$"):gsub(',', '')
                            lines[#lines + 1] = "." .. var .. " = " .. var
                        end
                    end
                end
                return table.concat(lines, ', ') .. ','
            end, { 2 }),
            i(3),
            i(0),
        }, {
            delimiters = "<>"
        }),
        fmt([[
        pub const <> = struct {
            <>

            pub fn init(<>) <> {
                <>
            }<>
        };<>
        ]], {
            i(1, "MyStruct"),
            i(2),
            f(function(args)
                local lines = {}
                for _, line in ipairs(args[1]) do
                    lines[#lines + 1] = line:gsub('^%s+', ''):gsub(',', '')
                end
                return table.concat(lines, ', ')
            end, { 2 }),
            rep(1),
            i(3),
            i(4),
            i(0),
        }, {
            delimiters = "<>"
        })),
    s({ trig = "aoc", name = "Advent of Code", dscr = "Advent of Code" }, fmt([[
            const std = @import("std");
            const common = @import("../../common.zig");

            fn <>(<>) <> {
                <>
            }

            pub fn main() !void {
                var gpa = std.heap.GeneralPurposeAllocator(.{}){};
                const allocator = gpa.allocator();
                defer _ = gpa.deinit();

                const input = try common.getInput(allocator, "input.txt", <> * 1024);
                defer allocator.free(input);

                // std.debug.print("Part 1:{d}\n", .{});"
                // std.debug.print("Part 2: {d}\n", .{});"
            }

            pub fn runTests(alloctor: std.mem.Allocator) !void {
                try testExample1(alloctor);
                try testExample2(alloctor);
            }

            fn testExample1(allocator: std.mem.Allocator) !void {
                const input = try common.getInput(allocator, "demo_1.txt", 64);
                defer allocator.free(input);

                // try std.testing.expectEqual(<>, FUNCTION);
            }

            fn testExample2(allocator: std.mem.Allocator) !void {
                const input = try common.getInput(allocator, "demo_2.txt", 64);
                defer allocator.free(input);

                // try std.testing.expectEqual(<>, FUNCTION);
            }
            ]], {
        i(4),
        i(5),
        i(6),
        i(0),
        i(1),
        i(2),
        i(3),
    }, {
        delimiters = "<>"
    }))
})

ls.add_snippets('rust', {
    s({ trig = "aoc", name = "Advent of Code", dscr = "Advent of Code" }, fmt([[
        fn part_1(input: &str) -> String {
            AC
            return "".to_string();
        }

        fn part_2(input: &str) -> String {
            return "".to_string();
        }

        fn main() {
            let input = include_str!("../inputs/input.txt");
            println!("{}", part_1(&input));
            println!("{}", part_2(&input));
        }

        #[cfg(test)]
        mod tests {
            use super::*;
            #[test]
            fn test_part_1() {
                let input = include_str!("../inputs/demo.txt");
                assert_eq!(part_1(&input), "AC");
            }

            #[test]
            fn test_part_2() {
                let input = include_str!("../inputs/demo.txt");
                assert_eq!(part_2(&input), "");
            }
        }
        ]], {
        i(0),
        i(1)
    }, {
        delimiters = "AC"
    }))
})
