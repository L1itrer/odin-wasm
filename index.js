"use strict"

let wasm = null;
const canvas = document.getElementById("game");
const ctx = canvas.getContext('2d');
ctx.fillStyle = "#EE0000";

let game_update = null;
let game_draw = null;

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
        draw_rectangle
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

    window.requestAnimationFrame(game_loop);
});