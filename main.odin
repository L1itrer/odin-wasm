package main

import "core:fmt"
import "core:math"
import "game"
import "platform"
import ray "vendor:raylib"


//The game needs to use following things:
// TODO: Mouse handling
// DONE: Keyboard handling
// DONE: Texture Drawing
// DONE: Clearing the screen
// TODO: Playing some sounds
// TODO: Setting the browser icon

poll :: proc() {
	if ray.IsKeyDown(ray.KeyboardKey.W) do game.key_down('w')
	if ray.IsKeyDown(ray.KeyboardKey.S) do game.key_down('s')
	if ray.IsKeyDown(ray.KeyboardKey.A) do game.key_down('a')
	if ray.IsKeyDown(ray.KeyboardKey.D) do game.key_down('d')
	if ray.IsKeyUp(ray.KeyboardKey.W) do game.key_up('w')
	if ray.IsKeyUp(ray.KeyboardKey.S) do game.key_up('s')
	if ray.IsKeyUp(ray.KeyboardKey.A) do game.key_up('a')
	if ray.IsKeyUp(ray.KeyboardKey.D) do game.key_up('d')
	if ray.IsMouseButtonPressed(ray.MouseButton.LEFT) do game.clicked()
}


main :: proc() {

	ray.InitWindow(game.WINDOW_WIDTH, game.WINDOW_HEIGHT, "Odin on desktop")
	ray.InitAudioDevice()
	platform.init()

	ray.SetTargetFPS(60)

	for !ray.WindowShouldClose() {
		poll()
		game.update()
		ray.BeginDrawing()
		ray.ClearBackground(ray.BLACK)
		game.draw()
		ray.EndDrawing()
	}
	ray.CloseWindow()

}
