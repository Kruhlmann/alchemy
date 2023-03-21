SRC_DIR ?= src
TEST_DIR ?= tests
PKG_MANAGER ?= pnpm
PKG_LOCKFILE ?= pnpm-lock.yaml

TS_SOURCES ?= $(shell find "$(SRC_DIR)" -type f -name '*.ts')

include make/test.mk
include make/build.mk
include make/lint.mk
include make/dev.mk

run: dist/.build node_modules ## Run the program.
	node dist/main.js

clean: ## Clean source directory.
	rm -rf node_modules dist

node_modules: $(PKG_LOCKFILE)
	$(PKG_MANAGER) install

.PHONY: clean run