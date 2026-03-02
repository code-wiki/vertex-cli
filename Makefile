.PHONY: install uninstall test clean help

PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
SCRIPTS = bin/vertex-cli bin/vertex-chat bin/vertex-setup

help:
	@echo "Vertex CLI - Installation targets"
	@echo ""
	@echo "Usage:"
	@echo "  make install      Install Vertex CLI to $(BINDIR)"
	@echo "  make uninstall    Remove Vertex CLI from $(BINDIR)"
	@echo "  make test         Run tests"
	@echo "  make clean        Clean temporary files"
	@echo "  make help         Show this help message"
	@echo ""
	@echo "Options:"
	@echo "  PREFIX=<path>     Installation prefix (default: /usr/local)"

install: check-deps
	@echo "Installing Vertex CLI..."
	@mkdir -p $(BINDIR)
	@install -m 755 bin/vertex-cli $(BINDIR)/vertex-cli
	@install -m 755 bin/vertex-chat $(BINDIR)/vertex-chat
	@install -m 755 bin/vertex-setup $(BINDIR)/vertex-setup
	@echo "✓ Installed to $(BINDIR)"
	@echo ""
	@echo "Usage:"
	@echo "  vertex-cli        Configure AI providers"
	@echo "  vertex-chat       Start chat interface"
	@echo "  vertex-setup      Run setup wizard"

uninstall:
	@echo "Uninstalling Vertex CLI..."
	@rm -f $(BINDIR)/vertex-cli
	@rm -f $(BINDIR)/vertex-chat
	@rm -f $(BINDIR)/vertex-setup
	@echo "✓ Uninstalled from $(BINDIR)"

check-deps:
	@echo "Checking dependencies..."
	@command -v bash >/dev/null 2>&1 || { echo "✗ bash not found"; exit 1; }
	@command -v curl >/dev/null 2>&1 || { echo "✗ curl not found"; exit 1; }
	@command -v jq >/dev/null 2>&1 || { echo "⚠ jq not found (required for JSON parsing)"; }
	@echo "✓ Dependencies OK"

test:
	@echo "Running tests..."
	@bash tests/test_syntax.sh
	@echo "✓ All tests passed"

clean:
	@echo "Cleaning temporary files..."
	@find . -name "*.bak" -delete
	@find . -name "*~" -delete
	@echo "✓ Clean complete"

.DEFAULT_GOAL := help
