# 🤝 Contributing to Vertex CLI

Thank you for your interest in contributing to Vertex CLI! This document provides guidelines for contributing to this open-source project.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [How to Contribute](#how-to-contribute)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)

## 🤗 Code of Conduct

This project follows standard open-source community guidelines:

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Respect differing viewpoints and experiences

## 🚀 Getting Started

1. **Fork the repository**
   ```bash
   # Click "Fork" on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/vertex-cli.git
   cd vertex-cli
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/code-wiki/vertex-cli.git
   ```

## 💻 Development Setup

### Prerequisites

- Bash 4.0+
- gcloud CLI (for Vertex AI features)
- jq (JSON processor)
- curl

### Setup

```bash
# Make scripts executable
chmod +x vertex-cli bin/*

# Run setup
./bin/vertex-setup

# Test your changes
./vertex-cli
```

## 🛠️ How to Contribute

### Reporting Bugs

1. Check if the bug is already reported in [Issues](https://github.com/code-wiki/vertex-cli/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Steps to reproduce
   - Expected vs actual behavior
   - Your environment (OS, gcloud version, etc.)

### Suggesting Features

1. Check [existing feature requests](https://github.com/code-wiki/vertex-cli/issues?q=is%3Aissue+label%3Aenhancement)
2. Create a new issue with:
   - Clear use case
   - Proposed solution
   - Alternative solutions considered

### Code Contributions

1. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Follow coding standards (see below)
   - Add comments for complex logic
   - Update documentation if needed

3. **Test your changes**
   ```bash
   # Test all scripts
   ./tests/test_syntax.sh
   
   # Manual testing
   ./vertex-cli
   ./bin/vertex-chat
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add new feature description"
   ```

   Use conventional commits:
   - `feat:` New feature
   - `fix:` Bug fix
   - `docs:` Documentation changes
   - `refactor:` Code refactoring
   - `test:` Adding tests
   - `chore:` Maintenance tasks

5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create Pull Request**
   - Go to GitHub and create a PR
   - Fill in the PR template
   - Link related issues

## 📝 Coding Standards

### Bash Script Guidelines

```bash
#!/bin/bash

# Use strict mode
set -e

# Use meaningful variable names
USER_INPUT=""
CONFIG_FILE="$HOME/.ai-tools-config"

# Add comments for complex logic
# This function authenticates the user with GCP
authenticate_user() {
    # Implementation
}

# Use proper error handling
if ! command -v gcloud &> /dev/null; then
    echo "Error: gcloud not found"
    exit 1
fi

# Use consistent formatting
if [ "$condition" = "value" ]; then
    # Do something
fi
```

### Best Practices

1. **Error Handling**
   - Always check command success
   - Provide helpful error messages
   - Exit with appropriate codes

2. **User Experience**
   - Clear prompts and messages
   - Color-coded output (errors in red, success in green)
   - Progress indicators for long operations

3. **Security**
   - Never log sensitive data (API keys, tokens)
   - Use secure file permissions (600 for config files)
   - Validate user input

4. **Portability**
   - Test on multiple platforms (macOS, Linux)
   - Use POSIX-compliant commands when possible
   - Document platform-specific requirements

## 🧪 Testing

### Manual Testing Checklist

- [ ] Fresh installation works
- [ ] Authentication flow works
- [ ] Configuration saves correctly
- [ ] Chat interface functions properly
- [ ] Account switching works
- [ ] Error messages are clear
- [ ] Works on macOS
- [ ] Works on Linux

### Automated Tests

```bash
# Run syntax checks
./tests/test_syntax.sh

# Add new tests in tests/ directory
```

## 🔄 Pull Request Process

1. **Before Submitting**
   - Update README.md if needed
   - Update CHANGELOG.md
   - Ensure all tests pass
   - Update documentation

2. **PR Requirements**
   - Clear description of changes
   - Link to related issues
   - Screenshots for UI changes
   - Test results

3. **Review Process**
   - Maintainers will review within 48 hours
   - Address feedback promptly
   - Keep PR focused and small

4. **After Merge**
   - Delete your branch
   - Update your fork
   ```bash
   git checkout main
   git pull upstream main
   git push origin main
   ```

## 🎯 Areas for Contribution

### High Priority

- [ ] Add support for more AI providers
- [ ] Improve error handling
- [ ] Add conversation history
- [ ] Create automated tests
- [ ] Improve documentation

### Good First Issues

Look for issues labeled `good-first-issue` on GitHub.

## 📞 Getting Help

- **Questions**: Open a [Discussion](https://github.com/code-wiki/vertex-cli/discussions)
- **Bugs**: Open an [Issue](https://github.com/code-wiki/vertex-cli/issues)
- **Chat**: Join our community (link TBD)

## 🙏 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in documentation

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to Vertex CLI!** 🎉

Every contribution, no matter how small, makes a difference.
