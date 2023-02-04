package main

import (
	"fmt"
	"net"
	"os"
	"strconv"
	"time"
)

func IsOpened(host string, port int) bool {

	timeout := 5 * time.Second
	target := fmt.Sprintf("%s:%d", host, port)

	conn, err := net.DialTimeout("tcp", target, timeout)
	if err != nil {
		return false
	}

	if conn != nil {
		conn.Close()
		return true
	}

	return false
}

func main() {
	if len(os.Args) < 3 {
		fmt.Printf("use: %s HOST PORT\n", os.Args[0])
		os.Exit(0)
	}

	host := os.Args[1]
	port, err := strconv.Atoi(os.Args[2])
	if err != nil {
		fmt.Println("port must be number")
		os.Exit(1)
	}

	fmt.Println(IsOpened(host, port))
}
