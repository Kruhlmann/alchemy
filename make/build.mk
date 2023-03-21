build: dist/.build

dist/.build: $(TS_SOURCES) node_modules
	./node_modules/.bin/tsc
	touch dist/.build

.PHONY: build