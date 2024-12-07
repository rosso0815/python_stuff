package main

import (
	"fmt"
	"net/http"
	"os"
	"strings"
)

func index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Hello World</h1>")
	for _, env := range os.Environ() {
		// env is
		envPair := strings.SplitN(env, "=", 2)
		key := envPair[0]
		value := envPair[1]
		fmt.Fprintf(w, "%s : %s<br>", key, value)
	  }
}

// func check(w http.ResponseWriter, r *http.Request) {
// 	fmt.Fprintf(w, "<h1>Health check</h1>")
// }

func main() {
	http.HandleFunc("/", index)
	// http.HandleFunc("/health_check", check)
	fmt.Println("Server starting...")
	http.ListenAndServe(":5000", nil)
}
