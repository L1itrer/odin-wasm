package platform

import "core:fmt"
import "game"


main :: proc()
{
    a, b := 1.0, 2.0
    fmt.printfln("%v + %v = %v", a, b, game.add(a, b))
}