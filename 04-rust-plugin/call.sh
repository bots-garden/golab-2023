#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
minism call ./target/wasm32-wasi/release/rust_plugin.wasm \
hello \
--input "Jane Doe"

minism call ./target/wasm32-wasi/release/rust_plugin.wasm \
hello \
--input "John Doe"

echo ""