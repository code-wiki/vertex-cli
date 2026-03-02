# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Conversation history and context preservation
- Streaming responses for real-time chat
- Cost tracking and usage estimates
- Support for Azure OpenAI
- Support for AWS Bedrock
- Docker containerization
- Web interface
- Custom system prompts
- File upload support for vision models

## [1.0.0] - 2026-03-02

### Added
- Initial release of GCP AI Tools Runner
- Support for Claude via GCP Vertex AI
- Support for Gemini via GCP Vertex AI
- Support for OpenAI API
- Interactive configuration menu (`enable-ai.sh`)
- Simple chat interface (`chat.sh`)
- Automated setup script (`setup.sh`)
- GCP environment auto-detection
- Configuration persistence in `~/.ai-tools-config`
- Configuration testing functionality
- Comprehensive documentation:
  - README.md with full feature overview
  - QUICKSTART.md for fast setup
  - INSTALL.md for detailed installation
  - EXAMPLES.md with usage examples
  - CONTRIBUTING.md for contributors
  - SECURITY.md for security best practices
  - PROJECT_STRUCTURE.md for code organization
- GitHub issue templates for bugs and feature requests
- MIT License
- Security best practices:
  - `.gitignore` for sensitive files
  - Secure config file permissions (600)
  - API key validation
  - Authentication testing

### Features
- Multi-provider support (Claude, Gemini, OpenAI)
- Interactive menu-driven configuration
- Simple command-line chat interface
- Local and GCP VM compatibility
- Automatic dependency checking
- OS-specific installation support (macOS, Ubuntu, Debian, CentOS, RHEL)
- Color-coded terminal output
- Error handling and validation

### Security
- Config file permissions enforcement
- API key masking in display
- No hardcoded credentials
- Secure authentication flow
- Private config file storage

## Release Notes

### v1.0.0 - Initial Release

This is the first public release of GCP AI Tools Runner. The tool enables developers to:

1. **Use GCP Free Credits**: Leverage $300 GCP credits to access Claude and Gemini
2. **Multi-Provider Support**: Easily switch between Claude, Gemini, and OpenAI
3. **Simple Setup**: Interactive menu-driven configuration
4. **Cross-Platform**: Works on macOS and Linux (local or GCP VM)
5. **Open Source**: MIT licensed, free to use and modify

**Getting Started:**
```bash
git clone https://github.com/code-wiki/gcp-ai-tools-runner.git
cd gcp-ai-tools-runner
./setup.sh
./enable-ai.sh
```

**Feedback Welcome:**
This is an early release. Please report bugs, request features, and contribute improvements!

---

## Version History

- **1.0.0** (2026-03-02): Initial public release

## How to Contribute

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Reporting bugs
- Suggesting features
- Submitting pull requests
- Adding new AI providers

## Links

- [GitHub Repository](https://github.com/code-wiki/gcp-ai-tools-runner)
- [Issue Tracker](https://github.com/code-wiki/gcp-ai-tools-runner/issues)
- [Documentation](README.md)
