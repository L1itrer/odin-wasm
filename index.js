"use strict"

let wasm = null;

function introduce() {
    console.log("hello");
}

function sin(x) {
    return Math.sin(x);
}

WebAssembly.instantiateStreaming(fetch('game.wasm'), {
    platform: {
        introduce,
        sin
    }

}).then((w) => {
    wasm = w;
});