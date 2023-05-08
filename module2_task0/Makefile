build:  ## Compile the source code of the application to a binary
	go build

run:    ## Run the application in background by executing the binary
	./awesome-api >./awesome-api.log 2>&1 &

stop:   ## Stop the application with the command kill
	kill "$(pgrep awesome-api)"

clean:  ## Stop the application and delete the binary
	kill "$(pgrep awesome-api)"
	rm awesome-api awesome-api.log

test: 	## Test
	curl http://localhost:9999
	curl http://localhost:9999/health

help: 	## Print a list of all the goals with a sentence
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

