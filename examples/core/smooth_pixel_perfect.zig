const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    const virtual_screen_width = 160;
    const virtual_screen_height = 90;

    const virtual_ratio = @as(comptime_float, @floatFromInt(screen_width)) / @as(comptime_float, @floatFromInt(screen_height));

    rl.InitWindow(screen_width, screen_height, "raylib [core] example - smooth pixel-perfect camera");

    var world_space_camera = std.mem.zeroes(rl.Camera2D);
    world_space_camera.zoom = 1;

    var screen_space_camera = std.mem.zeroes(rl.Camera2D);
    screen_space_camera.zoom = 1;

    var target = rl.LoadRenderTexture(virtual_screen_width, virtual_screen_height);

    var rec01 = rl.Rectangle{ .x = 70, .y = 35, .width = 20, .height = 20 };
    var rec02 = rl.Rectangle{ .x = 90, .y = 30, .width = 30, .height = 10 };
    var rec03 = rl.Rectangle{ .x = 80, .y = 15, .width = 15, .height = 25 };

    const source_rec = rl.Rectangle{
        .x = 0,
        .y = 0,
        .width = @as(f32, @floatFromInt(target.texture.width)),
        .height = -@as(f32, @floatFromInt(target.texture.height)),
    };
    const dest_rec = rl.Rectangle{ .x = -virtual_ratio, .y = -virtual_ratio, .width = screen_width + (virtual_ratio * 2), .height = screen_height + (virtual_ratio * 2) };

    const origin = rl.Vector2{ .x = 0, .y = 0 };

    var rotation: f32 = 0;

    var camera_x: f32 = 0;
    var camera_y: f32 = 0;

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        rotation += 60 * rl.GetFrameTime();

        camera_x = @sin(@as(f32, @floatCast(rl.GetTime()))) * 50 - 10;
        camera_y = @cos(@as(f32, @floatCast(rl.GetTime()))) * 30;

        screen_space_camera.target = .{ .x = camera_x, .y = camera_y };

        world_space_camera.target.x = @floor(screen_space_camera.target.x);
        screen_space_camera.target.x -= world_space_camera.target.x;
        screen_space_camera.target.x *= virtual_ratio;

        world_space_camera.target.y = @floor(screen_space_camera.target.y);
        screen_space_camera.target.y -= world_space_camera.target.y;
        screen_space_camera.target.y *= virtual_ratio;

        rl.BeginTextureMode(target);
        {
            rl.ClearBackground(rl.RAYWHITE);

            rl.BeginMode2D(world_space_camera);
            {
                rl.DrawRectanglePro(rec01, origin, rotation, rl.BLACK);
                rl.DrawRectanglePro(rec02, origin, -rotation, rl.RED);
                rl.DrawRectanglePro(rec03, origin, rotation + 45, rl.BLUE);
            }
            rl.EndMode2D();
        }
        rl.EndTextureMode();

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RED);

            rl.BeginMode2D(screen_space_camera);
            {
                rl.DrawTexturePro(target.texture, source_rec, dest_rec, origin, 0.0, rl.WHITE);
            }
            rl.EndMode2D();

            rl.DrawText(rl.TextFormat("Screen resolution: {}x{}", .{ screen_width, screen_height }), 10, 10, 20, rl.DARKBLUE);
            rl.DrawText(rl.TextFormat("World resolution: {}x{}", .{ virtual_screen_width, virtual_screen_height }), 10, 40, 20, rl.DARKGREEN);
            rl.DrawFPS(rl.GetScreenWidth() - 95, 10);
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
