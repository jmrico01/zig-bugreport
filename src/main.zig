const std = @import("std");

const common = @import("common");

pub fn main() void
{
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
}
