package main
/* "vanilla"
  - add function
  - hello function
*/
// ✋ make this function callable from host
//export add
func add(x int, y int) int {
  return x + y
}

//export hello
func hello(name string) string {
  return "hello " + name
}

func main() {}

