#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
extism call ./target/wasm32-wasi/release/rust_plugin.wasm \
  hello \
  --input "👩 Jane Doe" \
  --wasi true
echo ""
extism call ./target/wasm32-wasi/release/rust_plugin.wasm \
  hello \
  --input "👨 John Doe" \
  --wasi true
echo ""
