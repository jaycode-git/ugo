generate:
	go generate ./...

lint:
	golint -set_exit_status ./...
	staticcheck ./...

test: generate lint
	go test ./...
	go test -race -cover ./...
	go run cmd/ugo/main.go -timeout 5s cmd/ugo/testdata/fibtc.ugo

fmt:
	go fmt ./...
