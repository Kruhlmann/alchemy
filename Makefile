.DEFAULT_GOAL := build
.ONESHELL:

SRC_DIR ?= src
TEST_DIR ?= tests
PKG_MANAGER ?= pnpm
PKG_LOCKFILE ?= pnpm-lock.yaml

TS_SOURCES ?= $(shell find "$(SRC_DIR)" -type f -name '*.ts') ./bin/alchemyc

include make/test.mk
include make/build.mk
include make/lint.mk
include make/dev.mk

.PHONY: clean
clean:
	rm -rf node_modules dist

node_modules: $(PKG_LOCKFILE)
	$(PKG_MANAGER) install

.PHONY: install
install: node_modules
	rm -rf $(DESTDIR)/usr/share/alchemy/std $(DESTDIR)/usr/bin/alchemyc
	install -d -m 755 $(DESTDIR)/usr/share/alchemy
	cp -r ./std $(DESTDIR)/usr/share/alchemy/std
	cp ./bin/alchemyc $(DESTDIR)/usr/bin/alchemyc
	test -d /usr/share/nvim/runtime/syntax && cp ./syntax/vim/alchemy.vim /usr/share/nvim/runtime/syntax/alchemy.vim
	test -d /usr/share/vim/vim90/syntax && cp ./syntax/vim/alchemy.vim /usr/share/vim/vim90/syntax/alchemy.vim

tests/alchemy_programs/%:
	mkdir -p $@
	printf '0' >$@/program.exitcode
	printf 'sub main\n  1 put\nmarine' >$@/program.alc
	printf 'SubInstruction<main>\nLiteralInstruction<main>\nPushIntInstruction<1>\nPutInstruction\nMarineInstruction' >$@/program.refmodel
	printf '1' >$@/program.stdout
