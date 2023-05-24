const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [shapes] example - raylib logo using shapes");

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            rl.DrawRectangle(screen_width / 2 - 128, screen_height / 2 - 128, 256, 256, rl.BLACK);
            rl.DrawRectangle(screen_width / 2 - 112, screen_height / 2 - 112, 224, 224, rl.RAYWHITE);
            rl.DrawText("raylib", screen_width / 2 - 44, screen_height / 2 + 48, 50, rl.BLACK);

            rl.DrawText("this is NOT a texture!", 350, 370, 10, rl.GRAY);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
