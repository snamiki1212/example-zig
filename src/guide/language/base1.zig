const expect = @import("std").testing.expect;

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
