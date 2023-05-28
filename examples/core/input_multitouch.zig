const std = @import("std");
const rl = @import("raylib");

const max_touch_points = 10;

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [core] example - input multitouch");

    var touch_positions: [max_touch_points]rl.Vector2 = undefined;

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        var t_count = @intCast(usize, @max(rl.GetTouchPointCount(), max_touch_points));

        for (0..t_count) |i| touch_positions[i] = rl.GetTouchPosition(@intCast(c_int, i));

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            for (0..t_count) |i| {
                if ((touch_positions[i].x > 0) and (touch_positions[i].y > 0)) {
                    rl.DrawCircleV(touch_positions[i], 34, rl.ORANGE);
                    rl.DrawText(
                        rl.TextFormat("%d", @intCast(c_int, i)),
                        @floatToInt(c_int, touch_positions[i].x - 10),
                        @floatToInt(c_int, touch_positions[i].y - 70),
                        40,
                        rl.BLACK,
                    );
                }
            }

            rl.DrawText("touch the screen at multiple locations to get multiple balls", 10, 10, 20, rl.DARKGRAY);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
