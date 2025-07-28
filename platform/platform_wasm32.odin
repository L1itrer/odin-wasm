package platform
foreign import "platform_wasm"
foreign platform_wasm {
	draw_player_texture :: proc "contextless" (x, y, scale, rotation: f32) ---
	sin :: proc "contextless" (x: f64) -> f64 ---
	introduce :: proc "contextless" () ---
	draw_rectangle :: proc "contextless" (x, y, w, h: f32) ---
	degrees_to_radians :: proc "contextless" (degree: f32) ---
}

