package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		vetList, err := vets()
		if err != nil {
			http.Error(w, fmt.Sprintf("unable to get vets: %q\n", err), 500)
			return
		}
		if err := pageTemplate.Execute(w, vetList); err != nil {
			http.Error(w, fmt.Sprintf("unable to execute template: %q\n", err), 500)
		}
	})

	fmt.Printf("Starting HTTP server at port %s\n", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
