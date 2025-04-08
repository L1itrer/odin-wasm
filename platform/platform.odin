#+build !wasm32
package platform

import "core:math"
import "core:fmt"
import "base:runtime"

sin :: proc (x: f64) -> f64
{
    return math.sin_f64(x)
}

introduce :: proc ()
{
    context = runtime.default_context()
    fmt.println("hello")
}