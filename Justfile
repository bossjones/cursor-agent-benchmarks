# Use PowerShell on Windows, otherwise use Bash
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# List all available commands
default:
    @just --list

# Install all dependencies
install:
    npm install

# Compile the project using webpack
compile:
    npm run compile

# Watch for changes and recompile automatically
watch:
    npm run watch

# Package for production with source maps hidden
package:
    npm run package

# Compile test files
compile-tests:
    npm run compile-tests

# Watch and compile test files
watch-tests:
    npm run watch-tests

# Run ESLint on source files
lint:
    npm run lint

# Run tests using vscode-test
test:
    npm test

# Prepare for VS Code extension publishing
publish:
    npm run vscode:prepublish

# Run all checks (lint and test)
check: lint test

# Clean build artifacts
clean:
    rm -rf dist
    rm -rf out
    rm -rf node_modules

# Reinstall dependencies from scratch
reinstall: clean install

# Add a production dependency
add package:
    npm install {{package}} --save

# Add a development dependency
add-dev package:
    npm install {{package}} --save-dev

# Update all dependencies
update:
    npm update

# Start development environment (compile + watch)
dev: compile
    npm run watch

# Run full CI pipeline locally
ci: install lint compile-tests test

# Create a new feature branch
feature branch:
    git checkout -b feature/{{branch}}

# Create a new bugfix branch
bugfix branch:
    git checkout -b bugfix/{{branch}}

# Format code using prettier (requires prettier to be installed)
format:
    npx prettier --write "src/**/*.{ts,tsx,js,jsx,json,md}"

# Show git status
status:
    git status

# Pull latest changes and update dependencies
update-all:
    git pull
    npm install
    npm update

# Build and test the extension
build-and-test: compile compile-tests test

# Open VS Code with the project
code:
    code .

# Generate TypeScript documentation (requires typedoc)
docs:
    npx typedoc src/

# Run the extension in debug mode
debug:
    code --extensionDevelopmentPath=$PWD
