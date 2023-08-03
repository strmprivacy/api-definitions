package main

import (
    "fmt"
    "log"
    "os"
    "os/exec"
    "os/signal"
    "syscall"

    "github.com/tokopedia/gripmock/stub"

    //_ "github.com/envoyproxy/protoc-gen-validate"
    _ "github.com/strmprivacy/api-definitions-go/v3/api/account/v1"
)

func main() {
    fmt.Println("Starting GripMock (generated version for STRM Privacy APIs)")
    if os.Getenv("GOPATH") == "" {
        log.Fatal("$GOPATH is empty")
    }

    stub.RunStubServer(stub.Options{
        StubPath: "/stubs",
        Port:     "4771",
        BindAddr: "0.0.0.0",
    })

    run, runerr := runGrpcServer("/go/src/grpc/")

    var term = make(chan os.Signal)
    signal.Notify(term, syscall.SIGTERM, syscall.SIGKILL, syscall.SIGINT)
    select {
    case err := <-runerr:
        log.Fatal(err)
    case <-term:
        fmt.Println("Stopping gRPC Server")
        run.Process.Kill()
    }
}

func runGrpcServer(output string) (*exec.Cmd, <-chan error) {
    run := exec.Command("go", "run", output+"server.go")
    run.Stdout = os.Stdout
    run.Stderr = os.Stderr
    err := run.Start()
    if err != nil {
        log.Fatal(err)
    }
    fmt.Printf("grpc server pid: %d\n", run.Process.Pid)
    runerr := make(chan error)
    go func() {
        runerr <- run.Wait()
    }()
    return run, runerr
}
