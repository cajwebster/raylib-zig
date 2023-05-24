// Window related functions
pub extern fn InitWindow(width: c_int, height: c_int, title: [*:0]const u8) void;
pub extern fn WindowShouldClose() bool;
pub extern fn CloseWindow() void;
pub extern fn IsWindowReady() bool;
pub extern fn IsWindowFullscreen() bool;
pub extern fn IsWindowHidden() bool;
pub extern fn IsWindowMinimized() bool;
pub extern fn IsWindowMaximized() bool;
pub extern fn IsWindowFocused() bool;
pub extern fn IsWindowResized() bool;
pub extern fn IsWindowState(flag: c_uint) bool;
pub extern fn SetWindowState(flags: c_uint) void;
pub extern fn ClearWindowState(flags: c_uint) void;
pub extern fn ToggleFullscreen() void;
pub extern fn MaximizeWindow() void;
pub extern fn MinimizeWindow() void;
pub extern fn RestoreWindow() void;
pub extern fn SetWindowIcon(image: Image) void;
pub extern fn SetWindowIcons(images: [*]Image, count: c_int) void;
pub extern fn SetWindowTitle(title: [*:0]const u8) void;
pub extern fn SetWindowPosition(x: c_int, y: c_int) void;
pub extern fn SetWindowMonitor(monitor: c_int) void;
pub extern fn SetWindowMinSize(width: c_int, height: c_int) void;
pub extern fn SetWindowSize(width: c_int, height: c_int) void;
pub extern fn SetWindowOpacity(opacity: f32) void;
pub extern fn GetWindowHandle() *anyopaque;
pub extern fn GetScreenWidth() c_int;
pub extern fn GetScreenHeight() c_int;
pub extern fn GetRenderWidth() c_int;
pub extern fn GetRenderHeight() c_int;
pub extern fn GetMonitorCount() c_int;
pub extern fn GetCurrentMonitor() c_int;
pub extern fn GetMonitorPosition(monitor: c_int) Vector2;
pub extern fn GetMonitorWidth(monitor: c_int) c_int;
pub extern fn GetMonitorHeight(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalWidth(monitor: c_int) c_int;
pub extern fn GetMonitorRefreshRate(monitor: c_int) c_int;
pub extern fn GetWindowPosition() Vector2;
pub extern fn GetWindowScaleDPI() Vector2;
pub extern fn GetMonitorName(monitor: c_int) [*:0]const u8;
pub extern fn SetClipboardText(text: [*:0]const u8) void;
pub extern fn GetClipboardText() [*:0]const u8;
pub extern fn EnableEventWaiting() void;
pub extern fn DisableEventWaiting() void;

// Custom frame control functions
// NOTE: Those functions are intended for advance users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL

// Cursor-related functions

// Drawing Related Functions
pub extern fn ClearBackground(color: Color) void;
pub extern fn BeginDrawing() void;
pub extern fn EndDrawing() void;

// VR stereo config functions for VR simulator

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1

// Screen-space-related functions

// Timing-related functions
pub extern fn SetTargetFPS(fps: c_int) void;

// Misc. functions

// Set custom callbacks
// WARNING: Callbacks setup is intended for advance users

// Files management functions

// Compression/Encoding functionality

// Input-related functions: keyboard
pub extern fn IsKeyPressed(key: c_int) bool;
pub extern fn IsKeyDown(key: c_int) bool;
pub extern fn IsKeyReleased(key: c_int) bool;
pub extern fn IsKeyUp(key: c_int) bool;
pub extern fn SetExitKey(key: c_int) void;
pub extern fn GetKeyPressed() c_int;
pub extern fn GetCharPressed() c_int;

// Input-related functions: gamepads

// Input-related functions: mouse
pub extern fn IsMouseButtonPressed(button: c_int) bool;
pub extern fn IsMouseButtonDown(button: c_int) bool;
pub extern fn IsMouseButtonReleased(button: c_int) bool;
pub extern fn IsMouseButtonUp(button: c_int) bool;
pub extern fn GetMouseX() c_int;
pub extern fn GetMouseY() c_int;
pub extern fn GetMousePosition() Vector2;
pub extern fn GetMouseDelta() Vector2;
pub extern fn SetMousePosition(x: c_int, y: c_int) void;
pub extern fn SetMouseOffset(offsetX: c_int, offsetY: c_int) void;
pub extern fn SetMouseScale(scaleX: f32, scaleY: f32) void;
pub extern fn GetMouseWheelMove() f32;
pub extern fn GetMouseWheelMoveV() Vector2;
pub extern fn SetMouseCursor(cursor: c_int) void;

// Input-related functions: touch

// Gestures and Touch Handling Functions

// Camera System Functions

// Basic shapes drawing functions
pub extern fn DrawPixel(posX: c_int, posY: c_int, color: Color) void;
pub extern fn DrawPixelV(position: Vector2, color: Color) void;
pub extern fn DrawLine(startPosX: c_int, startPosY: c_int, endPosX: c_int, endPosY: c_int, color: Color) void;
pub extern fn DrawLineV(startPos: Vector2, endPos: Vector2, color: Color) void;
pub extern fn DrawCircle(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawCircleGradient(centerX: c_int, centerY: c_int, radius: f32, color1: Color, color2: Color) void;
pub extern fn DrawCircleV(center: Vector2, radius: f32, color: Color) void;
pub extern fn DrawCircleLines(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawRectangle(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleGradientV(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientH(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleLines(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawTriangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleLines(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawPoly(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn DrawPolyLines(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn DrawPolyLinesEx(center: Vector2, sides: c_int, radius: f32, rotation: f32, lineThick: f32, color: Color) void;

// Basic shapes collision detection functions

// Image loading functions
// NOTE: These functions do not require GPU access

// Image generation functions

// Image manipulation functions

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)

// Texture loading functions
// NOTE: These functions require GPU access

// Texture configuration functions

// Texture drawing functions

// Color/pixel related functions

// Font loading/unloading functions

// Text Drawing Functions
pub extern fn DrawFPS(posX: c_int, posY: c_int) void;
pub extern fn DrawText(text: [*:0]const u8, posX: c_int, posY: c_int, fontSize: c_int, color: Color) void;

// Text font info functions

// Text codepoints management functions (unicode characters)

// Text strings management functions (no UTF-8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!
pub extern fn TextFormat(text: [*:0]const u8, ...) [*:0]const u8;

// Structs

fn VectorMath(comptime Self: type) type {
    return struct {
        pub fn zero() Self {
            var result: Self = undefined;
            inline for (@typeInfo(Self).Struct.fields) |fld| {
                @field(result, fld.name) = 0;
            }
            return result;
        }
        pub fn add(self: Self, other: Self) Self {
            var result: Self = undefined;
            inline for (@typeInfo(Self).Struct.fields) |fld| {
                @field(result, fld.name) = @field(self, fld.name) + @field(other, fld.name);
            }
            return result;
        }
        pub fn sub(self: Self, other: Self) Self {
            var result: Self = undefined;
            inline for (@typeInfo(Self).Struct.fields) |fld| {
                @field(result, fld.name) = @field(self, fld.name) - @field(other, fld.name);
            }
            return result;
        }
        pub fn mul(self: Self, other: anytype) Self {
            var result: Self = self;
            inline for (@typeInfo(Self).Struct.fields) |fld| {
                @field(result, fld.name) *= other;
            }
            return result;
        }
        pub fn div(self: Self, other: anytype) Self {
            var result: Self = self;
            inline for (@typeInfo(Self).Struct.fields) |fld| {
                @field(result, fld.name) /= other;
            }
            return result;
        }
        pub fn dot(self: Self, other: Self) @TypeOf(self.x) {
            var result: @TypeOf(self.x) = 0;
            inline for (@typeInfo(Self).Struct.fields) |fld| {
                result += @field(self, fld.name) * @field(other, fld.name);
            }
            return result;
        }
        pub fn mag_2(self: Self) @TypeOf(self.x) {
            return self.dot(self);
        }
        pub fn mag(self: Self) @TypeOf(self.x) {
            return @sqrt(self.mag_2());
        }
    };
}
pub const Vector2 = extern struct {
    x: f32,
    y: f32,

    pub usingnamespace VectorMath(Vector2);
};
pub const Vector3 = extern struct {
    x: f32,
    y: f32,
    z: f32,

    pub usingnamespace VectorMath(Vector3);
};
pub const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};

pub const Image = extern struct {
    data: ?*anyopaque,
    width: c_int,
    height: c_int,
    mipmaps: c_int,
    format: c_int,
};

// Custom raylib color palette for amazing visuals on WHITE background
pub const LIGHTGRAY = Color{ .r = 200, .g = 200, .b = 200, .a = 255 }; // Light Gray
pub const GRAY = Color{ .r = 130, .g = 130, .b = 130, .a = 255 }; // Gray
pub const DARKGRAY = Color{ .r = 80, .g = 80, .b = 80, .a = 255 }; // Dark Gray
pub const YELLOW = Color{ .r = 253, .g = 249, .b = 0, .a = 255 }; // Yellow
pub const GOLD = Color{ .r = 255, .g = 203, .b = 0, .a = 255 }; // Gold
pub const ORANGE = Color{ .r = 255, .g = 161, .b = 0, .a = 255 }; // Orange
pub const PINK = Color{ .r = 255, .g = 109, .b = 194, .a = 255 }; // Pink
pub const RED = Color{ .r = 230, .g = 41, .b = 55, .a = 255 }; // Red
pub const MAROON = Color{ .r = 190, .g = 33, .b = 55, .a = 255 }; // Maroon
pub const GREEN = Color{ .r = 0, .g = 228, .b = 48, .a = 255 }; // Green
pub const LIME = Color{ .r = 0, .g = 158, .b = 47, .a = 255 }; // Lime
pub const DARKGREEN = Color{ .r = 0, .g = 117, .b = 44, .a = 255 }; // Dark Green
pub const SKYBLUE = Color{ .r = 102, .g = 191, .b = 255, .a = 255 }; // Sky Blue
pub const BLUE = Color{ .r = 0, .g = 121, .b = 241, .a = 255 }; // Blue
pub const DARKBLUE = Color{ .r = 0, .g = 82, .b = 172, .a = 255 }; // Dark Blue
pub const PURPLE = Color{ .r = 200, .g = 122, .b = 255, .a = 255 }; // Purple
pub const VIOLET = Color{ .r = 135, .g = 60, .b = 190, .a = 255 }; // Violet
pub const DARKPURPLE = Color{ .r = 112, .g = 31, .b = 126, .a = 255 }; // Dark Purple
pub const BEIGE = Color{ .r = 211, .g = 176, .b = 131, .a = 255 }; // Beige
pub const BROWN = Color{ .r = 127, .g = 106, .b = 79, .a = 255 }; // Brown
pub const DARKBROWN = Color{ .r = 76, .g = 63, .b = 47, .a = 255 }; // Dark Brown

pub const WHITE = Color{ .r = 255, .g = 255, .b = 255, .a = 255 }; // White
pub const BLACK = Color{ .r = 0, .g = 0, .b = 0, .a = 255 }; // Black
pub const BLANK = Color{ .r = 0, .g = 0, .b = 0, .a = 0 }; // Blank (Transparent)
pub const MAGENTA = Color{ .r = 255, .g = 0, .b = 255, .a = 255 }; // Magenta
pub const RAYWHITE = Color{ .r = 245, .g = 245, .b = 245, .a = 255 }; // My own White (raylib logo)

// Constants

pub const KEY_NULL: c_int = 0;
pub const KEY_APOSTROPHE: c_int = 39;
pub const KEY_COMMA: c_int = 44;
pub const KEY_MINUS: c_int = 45;
pub const KEY_PERIOD: c_int = 46;
pub const KEY_SLASH: c_int = 47;
pub const KEY_ZERO: c_int = 48;
pub const KEY_ONE: c_int = 49;
pub const KEY_TWO: c_int = 50;
pub const KEY_THREE: c_int = 51;
pub const KEY_FOUR: c_int = 52;
pub const KEY_FIVE: c_int = 53;
pub const KEY_SIX: c_int = 54;
pub const KEY_SEVEN: c_int = 55;
pub const KEY_EIGHT: c_int = 56;
pub const KEY_NINE: c_int = 57;
pub const KEY_SEMICOLON: c_int = 59;
pub const KEY_EQUAL: c_int = 61;
pub const KEY_A: c_int = 65;
pub const KEY_B: c_int = 66;
pub const KEY_C: c_int = 67;
pub const KEY_D: c_int = 68;
pub const KEY_E: c_int = 69;
pub const KEY_F: c_int = 70;
pub const KEY_G: c_int = 71;
pub const KEY_H: c_int = 72;
pub const KEY_I: c_int = 73;
pub const KEY_J: c_int = 74;
pub const KEY_K: c_int = 75;
pub const KEY_L: c_int = 76;
pub const KEY_M: c_int = 77;
pub const KEY_N: c_int = 78;
pub const KEY_O: c_int = 79;
pub const KEY_P: c_int = 80;
pub const KEY_Q: c_int = 81;
pub const KEY_R: c_int = 82;
pub const KEY_S: c_int = 83;
pub const KEY_T: c_int = 84;
pub const KEY_U: c_int = 85;
pub const KEY_V: c_int = 86;
pub const KEY_W: c_int = 87;
pub const KEY_X: c_int = 88;
pub const KEY_Y: c_int = 89;
pub const KEY_Z: c_int = 90;
pub const KEY_LEFT_BRACKET: c_int = 91;
pub const KEY_BACKSLASH: c_int = 92;
pub const KEY_RIGHT_BRACKET: c_int = 93;
pub const KEY_GRAVE: c_int = 96;
pub const KEY_SPACE: c_int = 32;
pub const KEY_ESCAPE: c_int = 256;
pub const KEY_ENTER: c_int = 257;
pub const KEY_TAB: c_int = 258;
pub const KEY_BACKSPACE: c_int = 259;
pub const KEY_INSERT: c_int = 260;
pub const KEY_DELETE: c_int = 261;
pub const KEY_RIGHT: c_int = 262;
pub const KEY_LEFT: c_int = 263;
pub const KEY_DOWN: c_int = 264;
pub const KEY_UP: c_int = 265;
pub const KEY_PAGE_UP: c_int = 266;
pub const KEY_PAGE_DOWN: c_int = 267;
pub const KEY_HOME: c_int = 268;
pub const KEY_END: c_int = 269;
pub const KEY_CAPS_LOCK: c_int = 280;
pub const KEY_SCROLL_LOCK: c_int = 281;
pub const KEY_NUM_LOCK: c_int = 282;
pub const KEY_PRINT_SCREEN: c_int = 283;
pub const KEY_PAUSE: c_int = 284;
pub const KEY_F1: c_int = 290;
pub const KEY_F2: c_int = 291;
pub const KEY_F3: c_int = 292;
pub const KEY_F4: c_int = 293;
pub const KEY_F5: c_int = 294;
pub const KEY_F6: c_int = 295;
pub const KEY_F7: c_int = 296;
pub const KEY_F8: c_int = 297;
pub const KEY_F9: c_int = 298;
pub const KEY_F10: c_int = 299;
pub const KEY_F11: c_int = 300;
pub const KEY_F12: c_int = 301;
pub const KEY_LEFT_SHIFT: c_int = 340;
pub const KEY_LEFT_CONTROL: c_int = 341;
pub const KEY_LEFT_ALT: c_int = 342;
pub const KEY_LEFT_SUPER: c_int = 343;
pub const KEY_RIGHT_SHIFT: c_int = 344;
pub const KEY_RIGHT_CONTROL: c_int = 345;
pub const KEY_RIGHT_ALT: c_int = 346;
pub const KEY_RIGHT_SUPER: c_int = 347;
pub const KEY_KB_MENU: c_int = 348;
pub const KEY_KP_0: c_int = 320;
pub const KEY_KP_1: c_int = 321;
pub const KEY_KP_2: c_int = 322;
pub const KEY_KP_3: c_int = 323;
pub const KEY_KP_4: c_int = 324;
pub const KEY_KP_5: c_int = 325;
pub const KEY_KP_6: c_int = 326;
pub const KEY_KP_7: c_int = 327;
pub const KEY_KP_8: c_int = 328;
pub const KEY_KP_9: c_int = 329;
pub const KEY_KP_DECIMAL: c_int = 330;
pub const KEY_KP_DIVIDE: c_int = 331;
pub const KEY_KP_MULTIPLY: c_int = 332;
pub const KEY_KP_SUBTRACT: c_int = 333;
pub const KEY_KP_ADD: c_int = 334;
pub const KEY_KP_ENTER: c_int = 335;
pub const KEY_KP_EQUAL: c_int = 336;
pub const KEY_BACK: c_int = 4;
pub const KEY_MENU: c_int = 82;
pub const KEY_VOLUME_UP: c_int = 24;
pub const KEY_VOLUME_DOWN: c_int = 25;

pub const MOUSE_BUTTON_LEFT: c_int = 0;
pub const MOUSE_BUTTON_RIGHT: c_int = 1;
pub const MOUSE_BUTTON_MIDDLE: c_int = 2;
pub const MOUSE_BUTTON_SIDE: c_int = 3;
pub const MOUSE_BUTTON_EXTRA: c_int = 4;
pub const MOUSE_BUTTON_FORWARD: c_int = 5;
pub const MOUSE_BUTTON_BACK: c_int = 6;
