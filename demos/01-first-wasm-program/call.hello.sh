#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
wasmedge --reactor first.wasm hello "bob morane"
