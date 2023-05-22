const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("raylib", .{ .source_file = .{ .path = "raylib.zig" } });
}

pub fn link_raylib(exe: *std.build.Step.Compile) void {
    exe.linkLibC();
    exe.linkSystemLibrary("raylib");
}
