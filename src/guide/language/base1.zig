const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

pub fn main() !void {
    { // assignemnt
        const constant: i32 = 5;
        const inferred_constant = @as(i32, 5);
        _ = constant; // autofix
        _ = inferred_constant; // autofix
    }

    { // array
        const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
        const l = a.len;
        _ = l; // autofix
    }
}

test "if" {
    // if statement
    if (true) {
        try expect(true);
    } else {
        try expect(false);
    }

    { // one liner
        const x = if (true) 1 else "1";
        try expect(x == 1);
    }
}

test "for" {
    const str = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
    for (str) |c| {
        try expect(c != 'x');
    }

    for (str, 0..) |c, i| {
        try expect(c != 'x');
        try expect(i < str.len);
    }
}

test "defer" {
    {
        var x: i32 = 0;
        defer x = 1;
        try expect(x == 0); // not run defer yet
    }

    {
        var x: i32 = 0;
        {
            defer x = 1;
        } // run defer
        try expect(x == 1);
    }
}

test "switch" {
    const x: i32 = 1;
    switch (x) {
        1...10 => {
            print("1..10\n", .{});
        },
        -1...0 => {
            print("-1..0\n", .{});
        },
        11, 12 => {
            print("11,12\n", .{});
        },
        else => {
            print("else\n", .{});
        },
    }
}
