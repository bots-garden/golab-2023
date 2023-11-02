#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
minism call go-plugin.wasm say_hello \
--input "😀 Hello World 🌍! (from TinyGo)" \
--log-level info \
--allow-hosts '["*"]' \
--config '{"url":"https://jsonplaceholder.typicode.com/todos/1"}'

