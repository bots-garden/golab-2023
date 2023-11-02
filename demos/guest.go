// !+++ Wasm Program +++

//export hostHTTPGet
func hostHTTPGet(urlPos, urlSize uint32) uint32

func HTTPGet(url string) string {

	// you must implement CopyToMemory
	urlPos, urlSize := CopyToMemory(string(resp.Body))

	res := hostHTTPGet(urlPos, urlSize)

	// you must implement GetValuesFrom
	bodyPos, bodySize := GetValuesFrom(res)

	// you must implement ReadFromMemory
	buffer := ReadFromMemory(bodyPos, bodySize)

	body := string(buffer)

	return body

}

//export hello
func hello() {
	body := HTTPGet("https://golab.io")
}