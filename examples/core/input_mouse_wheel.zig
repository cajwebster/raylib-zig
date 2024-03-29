const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [core] example - input mouse wheel");

    var box_position_y: c_int = screen_height / 2 - 40;
    const scroll_speed = 4;

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        box_position_y -= @as(c_int, @intFromFloat(rl.GetMouseWheelMove() * scroll_speed));

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            rl.DrawRectangle(screen_width / 2 - 40, box_position_y, 80, 80, rl.MAROON);

            rl.DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, rl.GRAY);
            rl.DrawText(rl.TextFormat("Box position Y: {: >4}", .{box_position_y}), 10, 40, 20, rl.LIGHTGRAY);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
