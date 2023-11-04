const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [shapes] example - basic shapes drawing");

    var rotation: f32 = 0;

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        rotation += 0.2;

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            rl.DrawText("some basic shapes available on raylib", 20, 20, 20, rl.DARKGRAY);

            rl.DrawCircle(screen_width / 5, 120, 35, rl.DARKBLUE);
            rl.DrawCircleGradient(screen_width / 5, 220, 60, rl.GREEN, rl.SKYBLUE);
            rl.DrawCircleLines(screen_width / 5, 340, 80, rl.DARKBLUE);

            rl.DrawRectangle(screen_width / 4 * 2 - 60, 100, 120, 60, rl.RED);
            rl.DrawRectangleGradientH(screen_width / 4 * 2 - 90, 170, 180, 130, rl.MAROON, rl.GOLD);
            rl.DrawRectangleLines(screen_width / 4 * 2 - 40, 320, 80, 60, rl.ORANGE);

            rl.DrawTriangle(
                .{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3, .y = 80 },
                .{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3 - 60, .y = 150 },
                .{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3 + 60, .y = 150 },
                rl.VIOLET,
            );

            rl.DrawTriangleLines(
                .{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3, .y = 160 },
                .{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3 - 20, .y = 230 },
                .{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3 + 20, .y = 230 },
                rl.VIOLET,
            );

            rl.DrawPoly(.{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3, .y = 330 }, 6, 80, rotation, rl.BROWN);
            rl.DrawPolyLines(.{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3, .y = 330 }, 6, 90, rotation, rl.BROWN);
            rl.DrawPolyLinesEx(.{ .x = @as(f32, @floatFromInt(screen_width)) / 4 * 3, .y = 330 }, 6, 85, rotation, 6, rl.BEIGE);

            rl.DrawLine(18, 42, screen_width - 18, 42, rl.BLACK);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
