package main

import (
	"bytes"
	"fmt"
	"log"
	"net/http"
	"os/exec"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {

	out, err := exec.Command("/bin/sh", "/data/xiaoming/search/discount/script/statistics.sh").Output()
	//out, err := exec.Command("date").Output()

	if err != nil {
		log.Fatal(err)
	}
	var time_buf1 bytes.Buffer
	time_buf1.WriteString(time.Now().Format("2006-01-02 15:04:05"))
	fmt.Fprintf(w, "统计时间:%s\n", time_buf1.String())
	fmt.Fprintf(w, "统计结果如下:\n")
	fmt.Fprintf(w, "%s\n", out)

}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":10000", nil)
}
