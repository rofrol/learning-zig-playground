const std = @import("std");
pub fn main() !void {
    const n = Number{ .int = 42 };
    switch (n) {
        .int => {
            std.debug.print("int: {d}", .{n.int});
        },
        .float => {
            std.debug.print("float: {f}", .{n.float});
        },
        .nan => {
            std.debug.print("nan");
        },
    }
}

const Number = union {
    int: i64,
    float: f64,
    nan: void,
};
