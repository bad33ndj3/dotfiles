


# scripts to test ./default-install
build-container:
	@docker build . | tee .buildlog
test: build-container
	@docker run --rm -it $(shell grep "Successfully built" .buildlog | cut -d ' ' -f 3) && rm .buildlog