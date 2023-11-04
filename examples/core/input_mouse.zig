const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [core] example - keyboard input");

    var ball_position = rl.Vector2{
        .x = @as(f32, @floatFromInt(screen_width)) / 2,
        .y = @as(f32, @floatFromInt(screen_height)) / 2,
    };
    var ball_color = rl.DARKBLUE;

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        ball_position = rl.GetMousePosition();

        if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT))
            ball_color = rl.MAROON
        else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_MIDDLE))
            ball_color = rl.LIME
        else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_RIGHT))
            ball_color = rl.DARKBLUE
        else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_SIDE))
            ball_color = rl.PURPLE
        else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_EXTRA))
            ball_color = rl.YELLOW
        else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_FORWARD))
            ball_color = rl.ORANGE
        else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_BACK))
            ball_color = rl.BEIGE;

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            rl.DrawCircleV(ball_position, 40, ball_color);

            rl.DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, rl.DARKGRAY);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
