#+build !wasm32
package platform

import "base:runtime"
import "core:fmt"
import "core:math"
import ray "vendor:raylib"

sin :: proc(x: f64) -> f64 {
	return math.sin_f64(x)
}

introduce :: proc "contextless" () {
	context = runtime.default_context()
	fmt.println("hello")
}

draw_rectangle :: proc "contextless" (x, y, w, h: f32) {
	ray.DrawRectangle(i32(x), i32(y), i32(w), i32(h), ray.RED)
}


draw_player_texture :: proc "contextless" (x, y, scale, rotation: f32)
{
  position := ray.Vector2({x, y})
  ray.DrawTextureEx(player_texture, position, rotation, scale, ray.WHITE)
  // ray.DrawTexture(player_texture, i32(x), i32(y), ray.WHITE)
}

player_texture: ray.Texture

init :: proc "contextless" ()
{
  player_texture = ray.LoadTexture("./assets/sprites/redbird-midflap.png")
}
