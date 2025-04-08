package main

import "core:fmt"
import "core:math"
import "game"


main :: proc()
{
    a, b := 1.0, 2.0
    fmt.printfln("%v + %v = %v", a, b, game.add(a, b))
    game.say()
}