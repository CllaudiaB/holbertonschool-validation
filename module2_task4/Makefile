build:	## Generate the website from the markdown and configuration files in the directory dist/
	markdownlint README.md content/posts/*
	markdown-link-check README.md content/posts/*
	hugo

clean:	## Cleanup the content of the directory dist/
	rm -rf dist/*


post:	## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md  
	sed -i 's/title:.*/title:"$(POST_TITLE)"/' content/posts/$(POST_NAME).md

check:	## Succeed by default, and fail when presented with a dead link or a badly written Markdown file
	markdownlint README.md content/posts/*
	markdown-link-check README.md content/posts/*

validate:	## Always succeed by default and should print the result on the stdout 
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

help:	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
