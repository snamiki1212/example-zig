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
