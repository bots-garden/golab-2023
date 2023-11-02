#!/bin/bash
snippets generate \
  --input vanilla-wasm.yml \
  --output ../.vscode/vanilla-wasm.code-snippets 

snippets generate \
  --input wazero-wasm.yml \
  --output ../.vscode/wazero-wasm.code-snippets 

snippets generate \
  --input go-plugin.yml \
  --output ../.vscode/go-plugin.code-snippets 

snippets generate \
  --input host-app.yml \
  --output ../.vscode/host-app.code-snippets 
