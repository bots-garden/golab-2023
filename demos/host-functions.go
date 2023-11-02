// host function
extism.NewHostFunctionWithStack(
	"hostRobotMessage","env", 
	func(ctx Context, plugin *CurrentPlugin, stack []uint64) {
		offset := stack[0]
		buffer, _ := plugin.ReadBytes(offset)
		message := string(buffer)
		fmt.Println("🤖:>", message)
		stack[0] = 0
	},
    []api.ValueType{api.ValueTypeI64},
	api.ValueTypeI64,
)
