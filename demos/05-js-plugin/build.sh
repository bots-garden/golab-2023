#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
extism-js index.js -o hello-js.wasm

ls -lh *.wasm
