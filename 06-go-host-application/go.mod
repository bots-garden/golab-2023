module hostapp

go 1.21.1

require (
	github.com/extism/extism v0.4.0
	github.com/tetratelabs/wazero v1.3.0
)

require github.com/gobwas/glob v0.2.3 // indirect

replace github.com/extism/extism => ../go-sdk
