const std = @import("std");
const raylib_upstream = @import("raylib_upstream");

const examples = .{
    .core = .{
        "basic_window",
        "input_keys",
        "input_mouse",
        "input_mouse_wheel",
        "smooth_pixel_perfect",
    },
    .shapes = .{
        "basic_shapes",
        "logo_raylib",
        "logo_raylib_anim",
    },
};

var lib: ?*std.Build.CompileStep = null;

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    lib = b.dependency("raylib_upstream", .{}).artifact("raylib");

    const module = b.addModule("raylib", .{ .source_file = .{ .path = "raylib.zig" } });

    inline for (@typeInfo(@TypeOf(examples)).Struct.fields) |fld| {
        const prefix = "examples/" ++ fld.name ++ "/";
        inline for (@field(examples, fld.name)) |example| {
            const name = fld.name ++ "_" ++ example;
            const src = prefix ++ example ++ ".zig";

            const exe = b.addExecutable(.{
                .name = name,
                .root_source_file = .{ .path = src },
                .target = target,
                .optimize = optimize,
            });
            exe.addModule("raylib", module);
            link_raylib(exe);

            b.installArtifact(exe);
            const run_cmd = b.addRunArtifact(exe);

            run_cmd.step.dependOn(b.getInstallStep());

            const run_step = b.step(name, "Run the " ++ name ++ " example");
            run_step.dependOn(&run_cmd.step);
        }
    }
}

pub fn link_raylib(exe: *std.build.Step.Compile) void {
    exe.linkLibC();
    exe.linkLibrary(lib.?);
}
