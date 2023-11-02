#!/bin/bash
clear
bat $0 --line-range 5:
echo ""
hey -n 300 -c 100 -m POST \
-d 'John Doe' \
"http://localhost:8080" #> go-extism-report.txt
