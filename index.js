"use strict"

let wasm = null;
const canvas = document.getElementById("game");
const ctx = canvas.getContext('2d');
const player_image = document.getElementById("player");
ctx.fillStyle = "#EE0000";

let game_update = null;
let game_draw = null;
let degree_to_radians = null;

function introduce() {
    console.log("hello");
}

function sin(x) {
    return Math.sin(x);
}

function clearCanvas() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function draw_rectangle(x, y, w, h) {
    ctx.fillRect(x, y, w, h);
}

function draw_player_texture(x, y, scale, rotation) {
  ctx.setTransform(scale, 0, 0, scale, x, y);
  ctx.rotate(degree_to_radians(rotation));
  ctx.drawImage(player_image, -player_image.width/2, -player_image.height/2);
  ctx.setTransform(1, 0, 0, 1, 0, 0);
}

function game_loop() {
    game_update();
    clearCanvas();
    game_draw();
    window.requestAnimationFrame(game_loop);
}

WebAssembly.instantiateStreaming(fetch('game.wasm'), {
    platform_wasm: {
        introduce,
        sin,
        draw_rectangle,
        draw_player_texture,
    }

}).then((w) => {
    wasm = w;
    document.addEventListener("keydown", (e) => {
        wasm.instance.exports.key_down(e.key.charCodeAt())
    });

        document.addEventListener("keyup", (e) => {
        wasm.instance.exports.key_up(e.key.charCodeAt())
    });
    game_update = wasm.instance.exports.update
    game_draw   = wasm.instance.exports.draw
    degree_to_radians = wasm.instance.exports.degree_to_radians

    window.requestAnimationFrame(game_loop);
});
