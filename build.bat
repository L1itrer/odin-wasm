@echo off
odin build . -debug
odin build .\game -no-crt -no-entry-point -o:speed -target:js_wasm32
wasm2wat .\game.wasm -o game.wat
