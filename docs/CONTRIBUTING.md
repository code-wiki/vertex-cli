# Contributing to Vertex CLI

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your environment (OS, gcloud version, etc.)

### Suggesting Features

Feature suggestions are welcome! Please create an issue with:
- Clear description of the feature
- Use case and benefits
- Any implementation ideas you have

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to your branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Development Guidelines

### Code Style

- Use bash best practices
- Add comments for complex logic
- Use meaningful variable names
- Follow existing code formatting

### Testing

Before submitting a PR:
- Test on both local machine and GCP VM (if possible)
- Test with at least one AI provider (Claude, Gemini, or OpenAI)
- Verify all menu options work correctly
- Check for security issues (no exposed credentials)

### Security

- Never commit API keys or credentials
- Never hardcode sensitive information
- Always use environment variables or config files for secrets
- Review `.gitignore` before committing

## Adding New AI Providers

To add support for a new AI provider:

1. Add configuration function in `enable-ai.sh`:
```bash
configure_newai() {
    echo -e "${BLUE}\n--- Configuring NewAI ---${NC}"
    # Add configuration logic
}
```

2. Add API call function in `chat.sh`:
```bash
call_newai() {
    local prompt="$1"
    # Add API call logic
}
```

3. Update menu options and documentation
4. Test thoroughly

## Documentation

- Update README.md for any user-facing changes
- Add code comments for complex logic
- Update examples if adding new features

## Questions?

Feel free to open an issue for any questions about contributing.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on what's best for the community
- Show empathy towards others

Thank you for contributing! 🚀
