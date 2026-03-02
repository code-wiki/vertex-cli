<div align="center">

# Vertex CLI

### A unified CLI for Claude Code, Gemini, and OpenAI

**Run AI coding assistants directly from your terminal**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-blue)](https://github.com/code-wiki/vertex-cli)

[Quick Start](#quick-start) • [Features](#features) • [Installation](#installation) • [Documentation](#documentation)

---

</div>

## Why Vertex CLI?

**Problem:** AI coding assistants are powerful, but switching between different providers, managing API keys, and configuring each tool separately is tedious.

**Solution:** Vertex CLI gives you a single, unified interface to access Claude Code, Gemini, and OpenAI from your terminal.

### Key Benefits

| Feature | Description |
|---------|-------------|
| **Unified Interface** | One CLI for all major AI providers |
| **Quick Setup** | Configure once, use forever |
| **Terminal Native** | No browser, no GUI - just your terminal |
| **Provider Agnostic** | Switch between Claude, Gemini, and OpenAI instantly |
| **Open Source** | Free to use, modify, and contribute |

---

## Features

- **Multi-Provider Support** - Claude, Gemini, and OpenAI in one tool
- **Interactive Configuration** - Simple menu-driven setup
- **Persistent Settings** - Configure once, use everywhere
- **GCP Integration** - Use Claude and Gemini via Vertex AI
- **Direct API Support** - Connect to OpenAI directly
- **Cross-Platform** - Works on macOS, Linux, and Cloud Shell

---

## Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli

# Run from repo
./vertex-cli

# Or install system-wide
make install
vertex-cli
```

### First Use

```bash
# Configure your AI provider
vertex-cli

# Select from menu:
# 1) Configure Claude (Vertex AI)
# 2) Configure Gemini (Vertex AI)
# 3) Configure OpenAI

# Start coding with AI
vertex-chat
```

### Example Session

```
You: Write a Python function to validate email addresses

AI: Here's a Python function using regex:

def validate_email(email):
    import re
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None

# Example
print(validate_email("user@example.com"))  # True
print(validate_email("invalid"))            # False
```

---

## Prerequisites

### For Claude & Gemini (via Vertex AI)

- GCP account with Vertex AI enabled
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed
- `jq` for JSON processing

### For OpenAI

- OpenAI API key
- `jq` for JSON processing

### Installing Dependencies

**macOS:**
```bash
brew install jq google-cloud-sdk
```

**Ubuntu/Debian:**
```bash
sudo apt-get install jq
curl https://sdk.cloud.google.com | bash
```

**GCP Setup:**
```bash
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud services enable aiplatform.googleapis.com
```

---

## Installation

### Option 1: Run from Repository

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./vertex-cli
```

### Option 2: System-Wide Installation

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
make install
```

Commands available after installation:
- `vertex-cli` - Configure AI providers
- `vertex-chat` - Start chat interface
- `vertex-setup` - Run setup wizard

---

## Usage

### Configure Provider

Run the configuration tool:

```bash
vertex-cli
```

**Menu Options:**
1. Configure Claude (Vertex AI)
2. Configure Gemini (Vertex AI)
3. Configure OpenAI
4. Show current configuration
5. Test configuration
6. Launch AI chat interface
7. Exit

### Claude Setup

Select option 1 and provide:
- **Project ID** - Your GCP project
- **Region** - GCP region (default: us-central1)
- **Model** - Claude model version

Available models:
- `claude-3-5-sonnet@20240620` (recommended)
- `claude-3-opus@20240229`
- `claude-3-sonnet@20240229`
- `claude-3-haiku@20240307`

### Gemini Setup

Select option 2 and provide:
- **Project ID** - Your GCP project
- **Region** - GCP region (default: us-central1)
- **Model** - Gemini model version

Available models:
- `gemini-2.0-flash-exp` (fastest)
- `gemini-1.5-pro`
- `gemini-1.5-flash`

### OpenAI Setup

Select option 3 and provide:
- **API Key** - Your OpenAI API key
- **Model** - Model name (default: gpt-4o)
- **Endpoint** - API endpoint (default: https://api.openai.com/v1)

### Start Chatting

```bash
vertex-chat
```

Type your questions and get instant AI responses. Type `exit` or `quit` to end the session.

---

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

You can edit this file manually or reconfigure using `vertex-cli`.

---

## Use Cases

### Code Generation

```bash
You: Create a REST API endpoint for user authentication
AI: [Generates Flask/FastAPI code with authentication logic]
```

### Code Review

```bash
You: Review this function for security issues
AI: [Analyzes code and suggests improvements]
```

### Debugging

```bash
You: Why is this throwing a TypeError?
AI: [Explains the error and provides fix]
```

### Documentation

```bash
You: Write docstrings for this module
AI: [Generates comprehensive documentation]
```

---

## Advanced Usage

### Using in Scripts

```bash
#!/bin/bash
source ~/.ai-tools-config

echo "Active AI: $AI_TOOL ($MODEL)"
# Your automation here
```

### Running on GCP VMs

Vertex CLI auto-detects GCP VMs and uses service account authentication:

```bash
# On GCP VM - no extra auth needed
vertex-cli
```

### Switching Providers

Simply run `vertex-cli` again and select a different option.

---

## Troubleshooting

<details>
<summary><b>gcloud command not found</b></summary>

Install gcloud CLI:
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```
</details>

<details>
<summary><b>jq command not found</b></summary>

Install jq:
```bash
brew install jq           # macOS
sudo apt-get install jq   # Ubuntu/Debian
sudo yum install jq       # CentOS/RHEL
```
</details>

<details>
<summary><b>Authentication errors</b></summary>

Re-authenticate:
```bash
gcloud auth application-default login
gcloud auth application-default print-access-token  # verify
```
</details>

<details>
<summary><b>API not enabled</b></summary>

Enable Vertex AI:
```bash
gcloud services enable aiplatform.googleapis.com
```
</details>

<details>
<summary><b>Permission denied</b></summary>

Grant required roles:
```bash
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="user:YOUR_EMAIL" \
  --role="roles/aiplatform.user"
```
</details>

---

## Project Structure

```
vertex-cli/
├── bin/              # Executable scripts
│   ├── vertex-cli    # Configuration UI
│   ├── vertex-chat   # Chat interface
│   └── vertex-setup  # Setup wizard
├── docs/             # Documentation
├── tests/            # Test scripts
└── assets/           # Project assets
```

---

## Documentation

| Document | Description |
|----------|-------------|
| [Quick Start](docs/QUICKSTART.md) | Get started in 5 minutes |
| [Installation](docs/INSTALL.md) | Detailed setup guide |
| [Examples](docs/EXAMPLES.md) | Usage examples |
| [Architecture](docs/ARCHITECTURE.md) | System design |
| [Contributing](docs/CONTRIBUTING.md) | Contribution guide |
| [Security](docs/SECURITY.md) | Security practices |

---

## Examples

### Generate a Function

```bash
You: Write a binary search function in Python

AI: Here's an efficient binary search implementation:

def binary_search(arr, target):
    left, right = 0, len(arr) - 1

    while left <= right:
        mid = (left + right) // 2

        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1  # Not found

# Example
numbers = [1, 3, 5, 7, 9, 11, 13]
print(binary_search(numbers, 7))  # Output: 3
```

### Debug Code

```bash
You: Why does this fail? for i in 5: print(i)

AI: The error occurs because you're trying to iterate over an integer.
    Python requires an iterable object (list, tuple, range, etc.)

    Fix: Use range() to create an iterable

    for i in range(5):
        print(i)

    This prints: 0, 1, 2, 3, 4
```

### Explain Concepts

```bash
You: Explain async/await in JavaScript

AI: async/await is syntactic sugar for Promises:

    // Traditional Promise
    fetch(url)
      .then(response => response.json())
      .then(data => console.log(data))

    // With async/await (cleaner)
    async function getData() {
      const response = await fetch(url);
      const data = await response.json();
      console.log(data);
    }

    Benefits:
    - More readable, synchronous-looking code
    - Better error handling with try/catch
    - Easier to debug
```

More examples in [docs/EXAMPLES.md](docs/EXAMPLES.md)

---

## Contributing

Contributions are welcome! Here's how to help:

1. **Report bugs** - [GitHub Issues](https://github.com/code-wiki/vertex-cli/issues)
2. **Suggest features** - [Feature Requests](https://github.com/code-wiki/vertex-cli/issues/new)
3. **Submit PRs** - See [CONTRIBUTING.md](docs/CONTRIBUTING.md)
4. **Star the repo** - Help others discover this tool
5. **Share** - Spread the word

---

## License

MIT License - see [LICENSE](LICENSE)

Free to use, modify, and distribute.

---

## Support

<div align="center">

### Found this useful?

[![Star on GitHub](https://img.shields.io/github/stars/code-wiki/vertex-cli?style=social)](https://github.com/code-wiki/vertex-cli/stargazers)

**Get Help:**
- [Documentation](docs/QUICKSTART.md)
- [Report a Bug](https://github.com/code-wiki/vertex-cli/issues)
- [Request a Feature](https://github.com/code-wiki/vertex-cli/issues/new)

</div>

---

<div align="center">

**Built for developers, by developers**

[Home](https://github.com/code-wiki/vertex-cli) • [Docs](docs/QUICKSTART.md) • [Examples](docs/EXAMPLES.md) • [Contribute](docs/CONTRIBUTING.md)

</div>

---

<sub>**Disclaimer:** This is an unofficial tool and is not affiliated with Google Cloud, Anthropic, or OpenAI.</sub>
