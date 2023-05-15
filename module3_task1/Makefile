GO=go
TARGET=awesome-api
RM=rm -rf
MAKE=make
COVERAGE=coverage
HUGO=hugo

build:	## Generate the source code of the application to a binary.
	$(MAKE) lint
	$(GO) mod tidy
	$(MAKE) check && $(HUGO) && $(GO) build -o $(TARGET)

run:	## Run the application in background by executing the binary.
	./$(TARGET) >./$(TARGET).log 2>&1 &

post:	## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@if pgrep -x $(TARGET) > /dev/null; then \
		pkill $(TARGET); \
	fi
	@$(RM) $(TARGET) $(TARGET).log $(COVERAGE)-units.out $(COVERAGE)-integrations.out dist/ *~

test:	## Test the application.
	$(MAKE) unit-tests
	$(MAKE) integration-tests
	$(MAKE) validate

unit-tests: ## Run unit tests
	go test -v -short -coverprofile=$(COVERAGE)-units.out

integration-tests: ## Run integration tests
	go test -v -coverprofile=$(COVERAGE)-integrations.out

lint:	## Lint go lang code
	golangci-lint run

check:	## Lint markdonw source, check dead links
	markdownlint content/**/*.md
	find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check

validate:	## Validate the file dist/index.html using the command line Holberton’s W3C Validator.
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
