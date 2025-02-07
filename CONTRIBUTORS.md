# Contributing to Cursor Agent Benchmarks

Thank you for your interest in contributing to Cursor Agent Benchmarks! This document provides guidelines and instructions for contributing to the project.

## Table of Contents
- [Contributing to Cursor Agent Benchmarks](#contributing-to-cursor-agent-benchmarks)
  - [Table of Contents](#table-of-contents)
  - [Development Setup](#development-setup)
  - [Project Structure](#project-structure)
  - [Available Commands](#available-commands)
  - [Testing](#testing)
  - [Adding Dependencies](#adding-dependencies)
    - [Adding Production Dependencies](#adding-production-dependencies)
    - [Adding Development Dependencies](#adding-development-dependencies)
    - [Updating Dependencies](#updating-dependencies)
  - [Code Style and Linting](#code-style-and-linting)
  - [Submitting Changes](#submitting-changes)
    - [Pull Request Guidelines](#pull-request-guidelines)
  - [Questions or Problems?](#questions-or-problems)

## Development Setup

1. Fork and clone the repository:
```bash
git clone https://github.com/[your-username]/cursor-agent-benchmarks.git
cd cursor-agent-benchmarks
```

2. Install dependencies:
```bash
npm install
```

3. Open the project in VS Code:
```bash
code .
```

## Project Structure

- `src/` - Source code files
- `dist/` - Compiled output
- `tests/` - Test files
- `.vscode/` - VS Code specific settings
- `webpack.config.js` - Webpack configuration
- `tsconfig.json` - TypeScript configuration

## Available Commands

Here are the main npm commands available:

- `npm run compile` - Compile the project using webpack
- `npm run watch` - Watch for changes and recompile automatically
- `npm run package` - Package for production with source maps hidden
- `npm run compile-tests` - Compile test files
- `npm run watch-tests` - Watch and compile test files
- `npm run lint` - Run ESLint on source files
- `npm test` - Run tests using vscode-test
- `npm run vscode:prepublish` - Prepare for VS Code extension publishing

## Testing

We use the VS Code testing framework for our tests. To run tests:

1. Ensure tests are compiled:
```bash
npm run compile-tests
```

2. Run the tests:
```bash
npm test
```

To watch for changes during test development:
```bash
npm run watch-tests
```

## Adding Dependencies

### Adding Production Dependencies
```bash
npm install [package-name] --save
```

### Adding Development Dependencies
```bash
npm install [package-name] --save-dev
```

### Updating Dependencies
```bash
npm update
```

## Code Style and Linting

We use ESLint with TypeScript support. Our configuration extends the recommended TypeScript ESLint rules.

To check your code:
```bash
npm run lint
```

Key style points:
- Use TypeScript for all new code
- Include type annotations for function parameters and return types
- Add JSDoc comments for public APIs
- Follow the existing code style

## Submitting Changes

1. Create a new branch:
```bash
git checkout -b feature/your-feature-name
```

2. Make your changes and commit them:
```bash
git add .
git commit -m "Description of changes"
```

3. Push to your fork:
```bash
git push origin feature/your-feature-name
```

4. Create a Pull Request from your fork to our main repository.

### Pull Request Guidelines

- Include a clear description of the changes
- Add tests for new functionality
- Ensure all tests pass
- Make sure there are no linting errors
- Keep changes focused and atomic
- Update documentation as needed

## Questions or Problems?

Feel free to:
- Open an issue in the [issue tracker](https://github.com/bossjones/cursor-agent-benchmarks/issues)
- Ask questions in pull requests
- Reach out to the maintainers

Thank you for contributing to Cursor Agent Benchmarks!
