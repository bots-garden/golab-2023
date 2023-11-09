package main

import (
	"context"
	"fmt"
	"os"

	extism "github.com/extism/go-sdk"
	"github.com/tetratelabs/wazero"
)

func wasiPluginConfig() extism.PluginConfig {
	level := extism.Warn
	config := extism.PluginConfig{
		ModuleConfig: wazero.NewModuleConfig().WithSysWalltime(),
		EnableWasi:   true,
		LogLevel:     &level,
	}
	return config
}

func manifest(path string) extism.Manifest {
	manifest := extism.Manifest{
		Wasm: []extism.Wasm{
			extism.WasmFile{
				Path: path,
			},
		},
		Config:       make(map[string]string),
		AllowedHosts: []string{},
		AllowedPaths: make(map[string]string),
	}
	return manifest
}

func main() {

	ctx := context.Background()

	args := os.Args[1:]
	wasmFilePath := args[0]
	functionName := args[1]
	input := args[2]

	pluginConfig := wasiPluginConfig()

	fmt.Println(wasmFilePath)

	// Plugin manifest
	pluginManifest := manifest(wasmFilePath)

	// Create a plugin instance
	wasmPlugin, err := extism.NewPlugin(ctx, pluginManifest, pluginConfig, []extism.HostFunction{})

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
