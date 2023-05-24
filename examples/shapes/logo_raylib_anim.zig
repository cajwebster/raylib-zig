const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [shapes] example - raylib logo using shapes");

    const logo_position_x = screen_width / 2 - 128;
    const logo_position_y = screen_height / 2 - 128;

    var frames_counter: c_int = 0;
    var letters_count: c_int = 0;

    var top_side_rec_width: c_int = 16;
    var left_side_rec_height: c_int = 16;

    var bottom_side_rec_width: c_int = 16;
    var right_side_rec_height: c_int = 16;

    var state: c_int = 0;
    var alpha: f32 = 1;

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        switch (state) {
            0 => {
                frames_counter += 1;

                if (frames_counter == 120) {
                    state = 1;
                    frames_counter = 0;
                }
            },
            1 => {
                top_side_rec_width += 4;
                left_side_rec_height += 4;

                if (top_side_rec_width == 256) state = 2;
            },
            2 => {
                bottom_side_rec_width += 4;
                right_side_rec_height += 4;

                if (bottom_side_rec_width == 256) state = 3;
            },
            3 => {
                frames_counter += 1;

                if (@divTrunc(frames_counter, 12) != 0) {
                    letters_count += 1;
                    frames_counter = 0;
                }

                if (letters_count >= 10) {
                    alpha -= 0.02;

                    if (alpha <= 0.0) {
                        alpha = 0.0;
                        state = 4;
                    }
                }
            },
            4 => {
                if (rl.IsKeyPressed(rl.KEY_R)) {
                    frames_counter = 0;
                    letters_count = 0;

                    top_side_rec_width = 16;
                    left_side_rec_height = 16;

                    bottom_side_rec_width = 16;
                    right_side_rec_height = 16;

                    alpha = 1;
                    state = 0;
                }
            },
            else => {},
        }

        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.RAYWHITE);

            switch (state) {
                0 => {
                    if (@rem(@divTrunc(frames_counter, 15), 2) != 0) rl.DrawRectangle(logo_position_x, logo_position_y, 16, 16, rl.BLACK);
                },
                1 => {
                    rl.DrawRectangle(logo_position_x, logo_position_y, top_side_rec_width, 16, rl.BLACK);
                    rl.DrawRectangle(logo_position_x, logo_position_y, 16, left_side_rec_height, rl.BLACK);
                },
                2 => {
                    rl.DrawRectangle(logo_position_x, logo_position_y, top_side_rec_width, 16, rl.BLACK);
                    rl.DrawRectangle(logo_position_x, logo_position_y, 16, left_side_rec_height, rl.BLACK);

                    rl.DrawRectangle(logo_position_x, logo_position_y + 240, bottom_side_rec_width, 16, rl.BLACK);
                    rl.DrawRectangle(logo_position_x + 240, logo_position_y, 16, right_side_rec_height, rl.BLACK);
                },
                3 => {
                    rl.DrawRectangle(logo_position_x, logo_position_y, top_side_rec_width, 16, rl.Fade(rl.BLACK, alpha));
                    rl.DrawRectangle(logo_position_x, logo_position_y + 16, 16, left_side_rec_height - 32, rl.Fade(rl.BLACK, alpha));

                    rl.DrawRectangle(logo_position_x, logo_position_y + 240, bottom_side_rec_width, 16, rl.Fade(rl.BLACK, alpha));
                    rl.DrawRectangle(logo_position_x + 240, logo_position_y + 16, 16, right_side_rec_height - 32, rl.Fade(rl.BLACK, alpha));

                    rl.DrawRectangle(@divTrunc(rl.GetScreenWidth(), 2) - 112, @divTrunc(rl.GetScreenHeight(), 2) - 112, 224, 224, rl.Fade(rl.RAYWHITE, alpha));

                    rl.DrawText(rl.TextSubtext("raylib", 0, letters_count), @divTrunc(rl.GetScreenWidth(), 2) - 44, @divTrunc(rl.GetScreenHeight(), 2) + 48, 50, rl.Fade(rl.BLACK, alpha));
                },
                4 => {
                    rl.DrawText("[R] REPLAY", 340, 200, 20, rl.GRAY);
                },
                else => {},
            }
        }
        rl.EndDrawing();
    }

    rl.CloseWindow();
}
