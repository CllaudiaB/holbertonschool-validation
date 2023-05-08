build:	## Compile source code of the application to a binary
	golangci-lint run
	go build

run:	## Run the application in background by executing the binary and write log into a file
	./awesome-api >./awesome-api.log 2>&1 &

stop:	## Stop the application with the command pkill
	pkill awesome-api || true

clean:	## Stop the application and Delete the binary and log file
	pkill awesome-api || true
	rm -f awesome-api awesome-api.log

test:	## Test it to ensure that it behaves as expected
	curl http://localhost:9999
	curl http://localhost:9999/health

lint:	## 	Fail when the linter catches and error
	golangci-lint run

unit-tests:		## Execute (successfully) the Golang unit tests
	go test -v -short -coverprofile=coverage-units.out

help:	## Show this help .
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
