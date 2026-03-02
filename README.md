# 🤖 GCP AI Tools Runner

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-blue.svg)](https://github.com/code-wiki/gcp-ai-tools-runner)

An interactive shell script to configure and use AI models (Claude, Gemini, OpenAI) on GCP Vertex AI or locally. Perfect for developers who want to leverage their GCP free credits and experiment with multiple AI models.

## 🌟 Why This Project?

- **Free Credits**: Maximize your GCP Vertex AI free credits for Claude and Gemini
- **Multi-Provider**: Easily switch between Claude, Gemini, and OpenAI
- **Simple Setup**: Interactive menu-driven configuration
- **Local & Cloud**: Works on both local machines and GCP VMs
- **Open Source**: Free to use, modify, and contribute

## Features

- Interactive menu-driven configuration
- Support for Claude, Gemini, and OpenAI
- Works on both local machines and GCP VMs
- Automatic GCP environment detection
- Simple chat interface
- Configuration persistence

## Prerequisites

### For Vertex AI (Claude & Gemini)
1. GCP account with Vertex AI API enabled
2. gcloud CLI installed and configured
3. `jq` for JSON parsing

```bash
# Install gcloud CLI
# Visit: https://cloud.google.com/sdk/docs/install

# Authenticate
gcloud auth login
gcloud auth application-default login

# Set your project
gcloud config set project YOUR_PROJECT_ID

# Enable Vertex AI API
gcloud services enable aiplatform.googleapis.com

# Install jq
# macOS
brew install jq

# Ubuntu/Debian
sudo apt-get install jq

# CentOS/RHEL
sudo yum install jq
```

### For OpenAI
1. OpenAI API key
2. `jq` for JSON parsing

## Installation

1. Clone or download this repository
2. Make scripts executable:

```bash
chmod +x enable-ai.sh chat.sh
```

## Usage

### Initial Setup

Run the main script:

```bash
./enable-ai.sh
```

This will display an interactive menu where you can:
1. Configure Claude (Vertex AI)
2. Configure Gemini (Vertex AI)
3. Configure OpenAI
4. Show current configuration
5. Test configuration
6. Launch AI chat interface
7. Exit

### Configuration

#### Claude Configuration
- Select option 1 from the menu
- Enter your GCP Project ID (or press Enter to use current)
- Enter GCP Region (default: us-central1)
- Enter Claude Model (default: claude-3-5-sonnet@20240620)

Available Claude models on Vertex AI:
- claude-3-5-sonnet@20240620
- claude-3-opus@20240229
- claude-3-sonnet@20240229
- claude-3-haiku@20240307

#### Gemini Configuration
- Select option 2 from the menu
- Enter your GCP Project ID
- Enter GCP Region (default: us-central1)
- Enter Gemini Model (default: gemini-2.0-flash-exp)

Available Gemini models:
- gemini-2.0-flash-exp
- gemini-1.5-pro
- gemini-1.5-flash

#### OpenAI Configuration
- Select option 3 from the menu
- Enter your OpenAI API key
- Enter model name (default: gpt-4o)
- Enter API endpoint (default: https://api.openai.com/v1)

### Using the Chat Interface

After configuration, select option 6 to launch the chat interface:

```bash
./chat.sh
```

Or run directly:

```bash
./chat.sh
```

Type your messages and press Enter. Type `exit` or `quit` to end the session.

## Configuration File

Configuration is saved to `~/.ai-tools-config`. You can manually edit this file if needed.

Example configuration for Claude:
```bash
AI_TOOL=claude
PROJECT_ID=my-gcp-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
ENDPOINT=https://us-central1-aiplatform.googleapis.com
```

## Troubleshooting

### Authentication Issues
```bash
# Re-authenticate with gcloud
gcloud auth application-default login

# Verify authentication
gcloud auth application-default print-access-token
```

### API Not Enabled
```bash
# Enable Vertex AI API
gcloud services enable aiplatform.googleapis.com
```

### Permission Issues
Make sure your GCP account has the following roles:
- Vertex AI User
- Service Account Token Creator

### Testing API Access

Test Claude/Gemini:
```bash
gcloud auth application-default print-access-token
```

Test OpenAI:
```bash
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Advanced Usage

### Using in Scripts

You can source the configuration and use the AI models in your own scripts:

```bash
#!/bin/bash
source ~/.ai-tools-config

# Use the configured AI tool
case $AI_TOOL in
    claude)
        # Call Claude via Vertex AI
        ;;
    gemini)
        # Call Gemini via Vertex AI
        ;;
    openai)
        # Call OpenAI
        ;;
esac
```

### Running on GCP VM

The script automatically detects if it's running on a GCP VM. On GCP VMs, you can use the default service account authentication:

```bash
# No need for gcloud auth login on GCP VMs
./enable-ai.sh
```

## Cost Considerations

- Vertex AI charges per API call based on tokens
- OpenAI charges per API call based on model and tokens
- Check your GCP credits and OpenAI credits balance
- Monitor usage in GCP Console or OpenAI Dashboard

## 📊 Comparison: Direct API vs GCP Vertex AI

| Feature | Direct API (OpenAI/Anthropic) | GCP Vertex AI |
|---------|-------------------------------|---------------|
| Free Credits | Limited trial credits | $300 GCP credits + AI credits |
| Setup | API key only | GCP account + gcloud CLI |
| Cost | Pay per token | Pay per token (use free credits) |
| Models | Latest models first | Slightly delayed updates |
| Privacy | Data sent to provider | Data in your GCP project |

## 🗺️ Roadmap

- [ ] Add support for Azure OpenAI
- [ ] Add support for AWS Bedrock
- [ ] Conversation history and context
- [ ] Code generation templates
- [ ] Multi-turn conversations
- [ ] Streaming responses
- [ ] Cost tracking and estimates
- [ ] Custom system prompts
- [ ] File upload support (for vision models)
- [ ] Docker containerization

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

### Contributors

Thanks to all contributors who have helped make this project better!

<!-- Add contributor images here once you have contributors -->

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Google Cloud Platform for Vertex AI
- Anthropic for Claude
- Google for Gemini
- OpenAI for GPT models

## 📧 Contact & Support

- Create an [Issue](https://github.com/code-wiki/gcp-ai-tools-runner/issues) for bug reports or feature requests
- Star ⭐ this repository if you find it helpful
- Share with others who might benefit from GCP AI credits

## ⚠️ Disclaimer

This is an unofficial tool and is not affiliated with Google Cloud, Anthropic, or OpenAI. Use at your own risk and always monitor your cloud costs.

## 📚 Related Resources

- [GCP Vertex AI Documentation](https://cloud.google.com/vertex-ai/docs)
- [Claude API Documentation](https://docs.anthropic.com/)
- [Gemini API Documentation](https://ai.google.dev/docs)
- [OpenAI API Documentation](https://platform.openai.com/docs)

---

**Made with ❤️ for the developer community**

*If this project helped you, consider giving it a star ⭐*
