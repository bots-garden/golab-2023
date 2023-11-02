#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
go build -ldflags="-s -w"
ls -lh wasm-server

