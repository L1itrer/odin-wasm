#+build !wasm32
package platform

import "core:math"
import "core:fmt"
import "base:runtime"
import ray "vendor:raylib"

sin :: proc (x: f64) -> f64
{
    return math.sin_f64(x)
}

introduce :: proc "contextless" ()
{
    context = runtime.default_context()
    fmt.println("hello")
}

draw_rectangle :: proc "contextless" (x, y, w, h: f32)
{
    ray.DrawRectangle(
        i32(x),
        i32(y),
        i32(w),
        i32(h),
        ray.RED
    )
}