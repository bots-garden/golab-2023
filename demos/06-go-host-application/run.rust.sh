#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
# args: wasm_file function_name
./hostapp \
../04-rust-plugin/target/wasm32-wasi/release/rust_plugin.wasm \
hello \
"Bob Morane"

echo ""