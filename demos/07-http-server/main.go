package main

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"os"
	"sync"

	"github.com/extism/extism"
	"github.com/gofiber/fiber/v2"
	"github.com/tetratelabs/wazero"
)

// store all your plugins in a normal Go hash map, protected by a Mutex
// (reproduce something like the node.js event loop)
// to avoid "memory collision 💥"
var m sync.Mutex
var plugins = make(map[string]*extism.Plugin)

func StorePlugin(plugin *extism.Plugin) {
	plugins["code"] = plugin
}

func GetPlugin() (extism.Plugin, error) {
	if plugin, ok := plugins["code"]; ok {
		return *plugin, nil
	} else {
		return extism.Plugin{}, errors.New("🔴 no plugin")
	}
}

func main() {
	wasmFilePath := os.Args[1:][0]
	wasmFunctionName := os.Args[1:][1]
	httpPort := os.Args[1:][2]

	ctx := context.Background()

	config := extism.PluginConfig{
		ModuleConfig: wazero.NewModuleConfig().WithSysWalltime(),
		EnableWasi:   true,
	}

	manifest := extism.Manifest{
		Wasm: []extism.Wasm{
			extism.WasmFile{
				Path: wasmFilePath},
		},
		AllowedHosts:  []string{"*"}, 
	}

	pluginInst, err := extism.NewPlugin(ctx, manifest, config, nil) // new
	if err != nil {
		log.Println("🔴 !!! Error when loading the plugin", err)
		os.Exit(1)
	}

	StorePlugin(pluginInst)


	app := fiber.New(fiber.Config{DisableStartupMessage: true})

	app.Post("/", func(c *fiber.Ctx) error {

		params := c.Body()

		m.Lock()
		// don't forget to release the lock on the Mutex
		defer m.Unlock()

		pluginInst, err := GetPlugin()

		if err != nil {
			log.Println("🔴 !!! Error when getting the plugin", err)
			c.Status(http.StatusInternalServerError)
			return c.SendString(err.Error())
		}

		_, out, err := pluginInst.Call(wasmFunctionName, params)

		if err != nil {
			fmt.Println(err)
			c.Status(http.StatusConflict)
			return c.SendString(err.Error())
		} else {
			c.Status(http.StatusOK)

			return c.SendString(string(out))
		}

	})

	fmt.Println("🌍 http server is listening on:", httpPort)
	app.Listen(":" + httpPort)
}
