#!/bin/bash


cat > ./01-first-wasm-program/main.go <<- EOM
package main
/* "vanilla"
  - add function
  - hello function
*/


func main() {}

EOM


cat > ./02-wazero/cli/main.go <<- EOM
package main
// wz
func main() {

  // 1- Create instance of a wazero runtime
  
  // 2- Load the WebAssembly module

  // 3- Instantiate the Wasm plugin/program.

  // 4- Get the reference to the Wasm function: "hello"

  // 5- Passing parameters to the Wasm function: "hello"

  // 6- Call hello(pos, size)

  // 7- Read the value from the memory

}
EOM


cat > ./02-wazero/function/main.go <<- EOM
package main
// wz
// We need some helpers (read and copy)

// 8- Read memory

// 9- Copy data to memory

// 10- hello function

func main () {}

EOM


cat > ./03-go-plugin/main.go <<- EOM
package main
// go

//export say_hello
func say_hello() {

	// read input

	// read config

	// use a host function to make a request 

	// create output

}

func main() {}

EOM


cat > ./06-go-host-application/main.go <<- EOM
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

EOM