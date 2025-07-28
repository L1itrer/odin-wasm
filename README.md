# WASM in Odinlang

A very basicexample of a "game" that works both natively and in a browser using wasm. The idea is that you divide your game into the platform layer and the game layer. The game layer contains all logic and calls functions from the platform (like drawing, playing sounds etc). The platform layer is implemented for every supported platform, in the case of this example in raylib for dekstop and javascript for browser.

# Dependencies

The "game" is written in [odin](https://odin-lang.org/), as such you need a working odin compiler.

# Building

## Desktop (Window, Linux, Mac)

Building the game on the desktop platform is quite straightforward, from within the project root directory run:
```bash
odin build .
```

## Browser

To run the "game" in the browser compile the game directory to wasm with the command:

```bash
odin build .\game -no-crt -no-entry-point -o:speed -target:js_wasm32
```
Afterward you need to host an http server. The simplest way i know of is to use python's http.server module:

```bash
<path_to_interpreter> -m http.server
```
The game should be hosted on http://localhost:8000.

