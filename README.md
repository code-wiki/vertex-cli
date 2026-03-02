# Vertex CLI

> A unified command-line interface for Claude, Gemini, and OpenAI via GCP Vertex AI

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-blue.svg)](https://github.com/code-wiki/vertex-cli)

Maximize your GCP $300 free credits by accessing Claude and Gemini through Vertex AI, with OpenAI support included.

## Quick Start

```bash
# Clone and setup
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./setup.sh

# Configure your AI provider
./enable-ai.sh

# Start chatting
./chat.sh
```

## Prerequisites

**For Vertex AI (Claude & Gemini):**
- GCP account with Vertex AI API enabled
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed
- `jq` JSON processor

**For OpenAI:**
- OpenAI API key
- `jq` JSON processor

### Install Dependencies

**macOS:**
```bash
brew install jq
brew install --cask google-cloud-sdk
```

**Ubuntu/Debian:**
```bash
sudo apt-get install jq
curl https://sdk.cloud.google.com | bash
```

### Setup GCP

```bash
# Authenticate
gcloud auth login
gcloud auth application-default login

# Set project
gcloud config set project YOUR_PROJECT_ID

# Enable Vertex AI
gcloud services enable aiplatform.googleapis.com
```

## Usage

### 1. Run Setup Script

```bash
./setup.sh
```

This checks dependencies and sets up the environment.

### 2. Configure AI Provider

```bash
./enable-ai.sh
```

You'll see an interactive menu:

```
1) Configure Claude (Vertex AI)
2) Configure Gemini (Vertex AI)
3) Configure OpenAI
4) Show current configuration
5) Test configuration
6) Launch AI chat interface
7) Exit
```

#### Claude Configuration

Select option 1 and provide:
- **Project ID**: Your GCP project (or press Enter for default)
- **Region**: GCP region (default: `us-central1`)
- **Model**: Claude model (default: `claude-3-5-sonnet@20240620`)

**Available Models:**
- `claude-3-5-sonnet@20240620` (recommended)
- `claude-3-opus@20240229`
- `claude-3-sonnet@20240229`
- `claude-3-haiku@20240307`

#### Gemini Configuration

Select option 2 and provide:
- **Project ID**: Your GCP project
- **Region**: GCP region (default: `us-central1`)
- **Model**: Gemini model (default: `gemini-2.0-flash-exp`)

**Available Models:**
- `gemini-2.0-flash-exp` (fastest)
- `gemini-1.5-pro`
- `gemini-1.5-flash`

#### OpenAI Configuration

Select option 3 and provide:
- **API Key**: Your OpenAI API key
- **Model**: OpenAI model (default: `gpt-4o`)
- **Endpoint**: API endpoint (default: `https://api.openai.com/v1`)

### 3. Start Chatting

```bash
./chat.sh
```

**Example Session:**
```
You: Write a Python function to sort a list
AI: Here's a Python function to sort a list:

def sort_list(lst, reverse=False):
    """Sort a list in ascending or descending order."""
    return sorted(lst, reverse=reverse)

# Usage
numbers = [3, 1, 4, 1, 5, 9]
print(sort_list(numbers))  # [1, 1, 3, 4, 5, 9]

You: exit
Goodbye!
```

## Configuration

Settings are stored in `~/.ai-tools-config`

**Example Configuration:**
```bash
AI_TOOL=claude
PROJECT_ID=my-gcp-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
ENDPOINT=https://us-central1-aiplatform.googleapis.com
```

You can manually edit this file to change settings.

## Advanced Usage

### Using in Your Own Scripts

```bash
#!/bin/bash
source ~/.ai-tools-config

# Your AI tool is configured
echo "Using: $AI_TOOL"
echo "Model: $MODEL"
```

### Running on GCP VMs

The tool auto-detects GCP VMs and uses service account authentication:

```bash
# On a GCP VM - no extra auth needed
./enable-ai.sh
```

### Switching Between Providers

Just run `./enable-ai.sh` again and select a different option to switch providers.

## Troubleshooting

### "gcloud not found"

Install the [gcloud CLI](https://cloud.google.com/sdk/docs/install):
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

### "jq not found"

Install jq:
```bash
brew install jq           # macOS
sudo apt-get install jq   # Ubuntu/Debian
```

### Authentication Failed

Re-authenticate:
```bash
gcloud auth application-default login
gcloud auth application-default print-access-token  # test
```

### API Not Enabled

Enable Vertex AI API:
```bash
gcloud services enable aiplatform.googleapis.com
```

### Permission Denied

Ensure your GCP account has these roles:
- Vertex AI User
- Service Account Token Creator

Grant roles:
```bash
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="user:YOUR_EMAIL" \
  --role="roles/aiplatform.user"
```

## Cost Information

| Provider | Cost Model | Free Credits |
|----------|-----------|--------------|
| Claude (Vertex AI) | Per token | $300 GCP credits |
| Gemini (Vertex AI) | Per token | $300 GCP credits |
| OpenAI | Per token | Limited trial |

**Monitor Usage:**
- GCP: [Console Billing](https://console.cloud.google.com/billing)
- OpenAI: [Usage Dashboard](https://platform.openai.com/usage)

## Why Use This?

✅ **Maximize Free Credits** - Use GCP's $300 credit for Claude & Gemini
✅ **No Vendor Lock-in** - Easy switching between providers
✅ **Simple Setup** - Interactive menu, no complex config
✅ **Portable** - Works on local machines and GCP VMs
✅ **Open Source** - Free to use and modify

## Examples

See [EXAMPLES.md](EXAMPLES.md) for detailed usage examples including:
- Code generation
- Debugging help
- Script integration
- Multi-provider comparisons

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](LICENSE) file

## Support

- 🐛 [Report bugs](https://github.com/code-wiki/vertex-cli/issues)
- 💡 [Request features](https://github.com/code-wiki/vertex-cli/issues/new)
- ⭐ Star this repo if it helps you!

## Related Documentation

- [Quick Start Guide](QUICKSTART.md) - Get started in 5 minutes
- [Installation Guide](INSTALL.md) - Detailed installation steps
- [Examples](EXAMPLES.md) - Real-world usage examples
- [Security](SECURITY.md) - Security best practices

---

**Disclaimer:** This is an unofficial tool, not affiliated with Google Cloud, Anthropic, or OpenAI.
