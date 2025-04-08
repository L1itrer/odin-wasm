package game


import "../platform"

@export
add :: proc (a, b :f64) -> f64
{
    return platform.sin(a + b + 10)
}

@export
say :: proc ()
{
    platform.introduce()
}