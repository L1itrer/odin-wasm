package game


foreign import "platform"
foreign platform {
    sin :: proc  "contextless" (x: f64) -> f64 ---
    introduce :: proc "contextless" () ---
}

@export
add :: proc "contextless" (a, b :f64) -> f64
{
    return sin(a + b + 10)
}

@export
say :: proc "contextless" ()
{
    introduce()
}