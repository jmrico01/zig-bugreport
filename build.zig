const std = @import("std");

pub fn build(b: *std.Build) void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const common = b.anonymousDependency(
        "deps/common",
        @import("deps/common/build.zig"),
        .{
            .target = target,
            .optimize = optimize,
        },
    );

    const exe = b.addExecutable(.{
        .name = "zig-bugreport",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    exe.addModule("common", common.module("common"));
    b.installArtifact(exe);
}
