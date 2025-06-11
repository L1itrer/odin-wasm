package platform
foreign import "platform_wasm"
foreign platform_wasm {
    sin :: proc  "contextless" (x: f64) -> f64 ---
    introduce :: proc "contextless" () ---
    draw_rectangle :: proc "contextless" (x, y, w, h: f32) ---
}