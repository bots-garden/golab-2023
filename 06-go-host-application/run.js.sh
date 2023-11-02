#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
# args: wasm_file function_name config
./hostapp ../05-js-plugin/hello-js.wasm \
hello \
"Bob Morane"

echo ""