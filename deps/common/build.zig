const std = @import("std");

pub fn build(b: *std.Build) void
{
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zigimg = b.dependency("zigimg", .{
        .target = target,
        .optimize = optimize,
    });
    const zigimgModule = zigimg.module("zigimg");

    const common = b.addModule("common", .{
        .source_file = .{.path = "src/common.zig"},
        .dependencies = &[_]std.build.ModuleDependency {
            .{.name = "zigimg", .module = zigimgModule},
        },
    });
    _ = common;
}
