test: ## run tests (recommended for local use)
	go test -coverprofile=coverage.out -timeout 10m -count=1 ./...

coverage: ## run coverage
	go tool cover -html=coverage.out

lint: ## lint checks for local
	golangci-lint run -v
	goimports -d .

format: ## basic code formatting fix
	golangci-lint run --fix
	goimports -w .

help: ## help messages for make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'
