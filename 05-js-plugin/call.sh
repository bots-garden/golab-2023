#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
minism call ./hello-js.wasm hello \
  --input "😀 Hello World 🌍! (from JavaScript)"
  