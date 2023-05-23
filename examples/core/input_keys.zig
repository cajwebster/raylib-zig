const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [core] example - keyboard input");

    var ball_position = rl.Vector2{
        .x = @intToFloat(f32, screen_width) / 2,
        .y = @intToFloat(f32, screen_height) / 2,
    };

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        if (rl.IsKeyDown(rl.KEY_RIGHT)) ball_position.x += 2;
        if (rl.IsKeyDown(rl.KEY_LEFT)) ball_position.x -= 2;
        if (rl.IsKeyDown(rl.KEY_UP)) ball_position.y -= 2;
        if (rl.IsKeyDown(rl.KEY_DOWN)) ball_position.y += 2;

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            rl.DrawText("Move the ball with arrow keys", 10, 10, 20, rl.DARKGRAY);

            rl.DrawCircleV(ball_position, 50, rl.MAROON);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
