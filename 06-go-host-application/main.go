package main
//host

import (
"context"
"os"
)

func main() {

ctx := context.Background()

args := os.Args[1:]
wasmFilePath := args[0]
functionName := args[1]
input := args[2]

// Plugin config

// Plugin manifest

// Create a plugin instance

// Call the function of the plugin

}

