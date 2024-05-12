const std = @import("std");
pub fn main() !void {
    const user = User{
        .power = 9001,
        .name = "Goku",
    };

    std.debug.print("{s}'s power is {d}", .{ user.name, user.power });
}

pub const User = struct {
    power: u64,
    name: []const u8,
};
