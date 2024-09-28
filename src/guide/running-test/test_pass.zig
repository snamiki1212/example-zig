const std = @import("std");
const expect = std.testing.expect;

test "always succesds" {
    try expect(true);
}
