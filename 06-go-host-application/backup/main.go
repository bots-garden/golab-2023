package main

import (
	"context"
	"fmt"
	"os"

	"github.com/extism/extism"
	"github.com/tetratelabs/wazero"
)

func main() {

	ctx := context.Background()

	args := os.Args[1:]
	wasmFilePath := args[0]
	functionName := args[1]
	input := args[2]

	// Plugin config
	levelInfo := extism.Info

	pluginConfig := extism.PluginConfig{
		ModuleConfig: wazero.NewModuleConfig().WithSysWalltime(),
		EnableWasi:   true,
		LogLevel:     &levelInfo,
	}

	// Plugin manifest
	pluginManifest := extism.Manifest{
		Wasm: []extism.Wasm{
			extism.WasmFile{Path: wasmFilePath},
		},
	}

	// Create a plugin instance
	wasmPlugin, err := extism.NewPlugin(ctx, pluginManifest, pluginConfig, nil)

	if err != nil {
		panic(err)
	}

	// Call the function of the plugin
	_, result, err := wasmPlugin.Call(
		functionName,
		[]byte(input),
	)

	if err != nil {
		fmt.Println("😡", err)
		os.Exit(1)
	} else {
		fmt.Println("🙂", string(result))
		os.Exit(0)
	}

}
