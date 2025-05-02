package game


import "../platform"

PLAYER_SIZE :: 50.0
WINDOW_HEIGHT :: 600
WINDOW_WIDTH :: 600
MOVEMENT_SPEED :: 10.0

Game :: struct
{
    x, y: f32,
    up, down, left, right : bool
}
game_state := Game{
    x = 100.0,
    y = 100.0
}

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

@export
key_down :: proc "contextless" (key_code: i32)
{
    switch key_code
    {
        case 'w':
            game_state.up = true
        case 's':
            game_state.down = true
        case 'a':
            game_state.left = true
        case 'd':
            game_state.right = true
    }
}

@export
key_up :: proc "contextless" (key_code: i32)
{
    switch key_code
    {
        case 'w':
            game_state.up = false
        case 's':
            game_state.down = false
        case 'a':
            game_state.left = false
        case 'd':
            game_state.right = false
    }
}



@export
update :: proc "contextless" ()
{
    if game_state.up
    {
        game_state.y -= MOVEMENT_SPEED
    }
    if game_state.down
    {
        game_state.y += MOVEMENT_SPEED
    }
    if game_state.left
    {
        game_state.x -= MOVEMENT_SPEED
    }
    if game_state.right
    {
        game_state.x += MOVEMENT_SPEED
    }
    
}

@export draw :: proc "contextless" () 
{
    platform.draw_rectangle(
        game_state.x,
        game_state.y,
        PLAYER_SIZE,
        PLAYER_SIZE
    )
}