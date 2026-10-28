package main

import (
  "encoding/base64"
  "net/http"
)

func main() {

  http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    w.Write([]byte(`{"msg":"pong"}`))
  })

  http.HandleFunc("/encoded", func(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte(base64.StdEncoding.EncodeToString([]byte(`{"msg":"pong"}`))))
  })

  http.ListenAndServe(":80", nil)
}
