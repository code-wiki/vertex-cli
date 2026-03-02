# Security Policy

## Supported Versions

This project is currently in active development. We recommend always using the latest version from the main branch.

## Security Best Practices

### For Users

1. **Never commit your configuration file**
   - The `.ai-tools-config` file contains sensitive information
   - It's already in `.gitignore`, but be careful not to force-add it

2. **Protect your API keys**
   - Never share your OpenAI API keys
   - Use GCP IAM best practices for service accounts
   - Rotate keys regularly

3. **Use appropriate GCP permissions**
   - Grant minimum necessary permissions
   - Use separate service accounts for different purposes
   - Enable audit logging

4. **Monitor usage**
   - Regularly check your GCP billing
   - Set up budget alerts
   - Monitor API usage for unexpected spikes

5. **Keep software updated**
   - Update gcloud CLI regularly
   - Keep your system packages updated
   - Pull latest changes from this repository

### For Contributors

1. **Never commit secrets**
   - Review changes before committing
   - Use git hooks to prevent accidental commits of secrets
   - Use `.gitignore` properly

2. **Code review**
   - Review code for potential security issues
   - Check for command injection vulnerabilities
   - Validate user inputs

3. **Dependencies**
   - Only use well-known, trusted tools
   - Document all external dependencies

## Reporting a Vulnerability

If you discover a security vulnerability, please:

1. **Do NOT** open a public issue
2. Email the maintainers privately (add your contact email in README)
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

We will respond within 48 hours and work with you to address the issue.

## Known Limitations

1. **API Keys in Memory**: API keys are stored in plaintext in the config file (`~/.ai-tools-config`)
   - Ensure proper file permissions (600)
   - Consider encrypting the config file for production use

2. **Command Injection**: User input is passed to API calls
   - Basic escaping is implemented
   - Be cautious with special characters in prompts

3. **Network Security**: API calls are made over HTTPS
   - Ensure your network connection is secure
   - Use VPN on untrusted networks

## Recommendations for Production Use

If using this in a production environment:

1. Use service accounts with minimal permissions
2. Implement rate limiting
3. Add request/response logging
4. Encrypt sensitive configuration files
5. Use secret management services (GCP Secret Manager, HashiCorp Vault, etc.)
6. Implement proper error handling and logging
7. Set up monitoring and alerting

## Security Checklist

Before using this tool:

- [ ] GCP project has appropriate IAM permissions
- [ ] API keys are kept secret
- [ ] `.gitignore` is properly configured
- [ ] Budget alerts are set up in GCP
- [ ] gcloud CLI is up to date
- [ ] Configuration file permissions are restrictive (chmod 600)
- [ ] You understand the cost implications of API usage

## Contact

For security concerns, please contact the maintainers through GitHub issues (for non-sensitive matters) or via private communication (for sensitive security issues).
