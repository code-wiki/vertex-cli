<div align="center">

```
██╗   ██╗███████╗██████╗ ████████╗███████╗██╗  ██╗     ██████╗██╗     ██╗
██║   ██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝╚██╗██╔╝    ██╔════╝██║     ██║
██║   ██║█████╗  ██████╔╝   ██║   █████╗   ╚███╔╝     ██║     ██║     ██║
╚██╗ ██╔╝██╔══╝  ██╔══██╗   ██║   ██╔══╝   ██╔██╗     ██║     ██║     ██║
 ╚████╔╝ ███████╗██║  ██║   ██║   ███████╗██╔╝ ██╗    ╚██████╗███████╗██║
  ╚═══╝  ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝     ╚═════╝╚══════╝╚═╝
```

### One CLI. Three AI Giants. Infinite Possibilities.

**Access Claude, Gemini, and OpenAI through a unified terminal interface**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-blue)](https://github.com/code-wiki/vertex-cli)
[![GCP](https://img.shields.io/badge/GCP-Vertex%20AI-4285F4?logo=google-cloud&logoColor=white)](https://cloud.google.com/vertex-ai)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Examples](#-examples) • [Support](#-support)

</div>

---

## 💡 Why Vertex CLI?

<table>
<tr>
<td width="50%">

### 🎯 **Smart Economics**
Leverage your **$300 GCP credits** to access Claude and Gemini through Vertex AI. No separate API subscriptions needed.

### ⚡ **Zero Friction**
Three commands. Five minutes. You're chatting with AI.

</td>
<td width="50%">

### 🔄 **Provider Agnostic**
Switch between Claude, Gemini, and OpenAI instantly. No vendor lock-in, ever.

### 🛡️ **Privacy First**
Your data stays in your GCP project when using Vertex AI. Full control, full transparency.

</td>
</tr>
</table>

---

## 🎨 Features

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                     │
│  ✓  Multi-Provider Support      Claude • Gemini • OpenAI          │
│  ✓  Interactive Configuration   Visual menu system                │
│  ✓  Smart Detection             Auto-identifies GCP VMs            │
│  ✓  Persistent Settings         Configure once, use forever        │
│  ✓  Cross-Platform              macOS, Linux, Cloud Shell          │
│  ✓  Script Integration          Use in your automation            │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 🚀 Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli

# Run automated setup
./setup.sh

# Configure your AI provider
./enable-ai.sh
```

### First Conversation

```bash
./chat.sh
```

```
You: Write a Python hello world
AI:  Here's a simple Python hello world:

     print("Hello, World!")

     You can also make it interactive:
     name = input("What's your name? ")
     print(f"Hello, {name}!")

You: exit
Goodbye!
```

**That's it.** You're now using enterprise AI models through your terminal.

---

## 🏗️ Architecture

```
┌──────────────────────────────────────────────────────────────────┐
│                         VERTEX CLI                               │
├──────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌──────────────┐      ┌──────────────┐      ┌──────────────┐ │
│   │              │      │              │      │              │ │
│   │   Claude     │      │   Gemini     │      │   OpenAI     │ │
│   │              │      │              │      │              │ │
│   └──────┬───────┘      └──────┬───────┘      └──────┬───────┘ │
│          │                     │                     │         │
│          └─────────────┬───────┴─────────────────────┘         │
│                        │                                        │
│                   ┌────▼─────┐                                 │
│                   │  Vertex  │                                 │
│                   │   CLI    │                                 │
│                   │  Router  │                                 │
│                   └────┬─────┘                                 │
│                        │                                        │
│          ┌─────────────┼─────────────┐                         │
│          │             │             │                         │
│     ┌────▼────┐   ┌────▼────┐   ┌───▼────┐                   │
│     │ GCP     │   │ GCP     │   │ OpenAI │                   │
│     │ Vertex  │   │ Vertex  │   │  API   │                   │
│     │   AI    │   │   AI    │   │        │                   │
│     └─────────┘   └─────────┘   └────────┘                   │
│                                                                  │
└──────────────────────────────────────────────────────────────────┘
```

---

## 📋 Prerequisites

<table>
<tr>
<th width="50%">For Vertex AI (Claude & Gemini)</th>
<th width="50%">For OpenAI</th>
</tr>
<tr>
<td>

- ☁️ GCP Account
- 🔧 [gcloud CLI](https://cloud.google.com/sdk/docs/install)
- 📦 `jq` JSON processor
- 💳 Vertex AI API enabled

</td>
<td>

- 🔑 OpenAI API Key
- 📦 `jq` JSON processor

</td>
</tr>
</table>

### Platform-Specific Setup

<details>
<summary><b>🍎 macOS</b></summary>

```bash
# Install Homebrew (if needed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install jq
brew install --cask google-cloud-sdk

# Authenticate with GCP
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud services enable aiplatform.googleapis.com
```

</details>

<details>
<summary><b>🐧 Ubuntu/Debian</b></summary>

```bash
# Install jq
sudo apt-get update && sudo apt-get install -y jq

# Install gcloud CLI
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Authenticate with GCP
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud services enable aiplatform.googleapis.com
```

</details>

<details>
<summary><b>🎩 CentOS/RHEL</b></summary>

```bash
# Install jq
sudo yum install -y jq

# Install gcloud CLI
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Authenticate with GCP
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
gcloud services enable aiplatform.googleapis.com
```

</details>

---

## 📖 Usage Guide

### Step 1: Launch Configuration

```bash
./enable-ai.sh
```

You'll see the interactive menu:

```
================================
   AI Tools Configuration
================================

--- Main Menu ---
1) Configure Claude (Vertex AI)
2) Configure Gemini (Vertex AI)
3) Configure OpenAI
4) Show current configuration
5) Test configuration
6) Launch AI chat interface
7) Exit
```

### Step 2: Configure Your Provider

<table>
<tr>
<th>Provider</th>
<th>Configuration</th>
<th>Models Available</th>
</tr>
<tr>
<td><b>Claude</b></td>
<td>

- Project ID
- Region
- Model

</td>
<td>

```
claude-3-5-sonnet@20240620 ⭐
claude-3-opus@20240229
claude-3-sonnet@20240229
claude-3-haiku@20240307
```

</td>
</tr>
<tr>
<td><b>Gemini</b></td>
<td>

- Project ID
- Region
- Model

</td>
<td>

```
gemini-2.0-flash-exp ⚡
gemini-1.5-pro
gemini-1.5-flash
```

</td>
</tr>
<tr>
<td><b>OpenAI</b></td>
<td>

- API Key
- Model
- Endpoint

</td>
<td>

```
gpt-4o
gpt-4-turbo
gpt-3.5-turbo
```

</td>
</tr>
</table>

### Step 3: Start Chatting

```bash
./chat.sh
```

---

## 🎯 Use Cases

<table>
<tr>
<td width="33%" align="center">

### 💻 Code Generation
```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + \
           fibonacci(n-2)
```

</td>
<td width="33%" align="center">

### 🐛 Debugging Help
```bash
TypeError: 'int' object
is not iterable

# AI explains & fixes
for i in range(5):
    print(i)
```

</td>
<td width="33%" align="center">

### 📝 Documentation
```markdown
## API Endpoint
GET /users/:id

Returns user profile
by unique identifier
```

</td>
</tr>
</table>

---

## 💰 Cost Comparison

| Provider | Access Method | Monthly Cost | Free Credits |
|----------|--------------|--------------|--------------|
| **Claude** | Vertex CLI → Vertex AI | Pay-as-you-go | ✅ $300 GCP credits |
| **Gemini** | Vertex CLI → Vertex AI | Pay-as-you-go | ✅ $300 GCP credits |
| **OpenAI** | Vertex CLI → Direct API | Pay-as-you-go | ⚠️ Limited trial |

💡 **Pro Tip:** Start with Vertex AI to maximize your free GCP credits before using paid APIs.

---

## 🔧 Advanced Configuration

### Configuration File

Your settings live in `~/.ai-tools-config`:

```bash
AI_TOOL=claude
PROJECT_ID=my-gcp-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
ENDPOINT=https://us-central1-aiplatform.googleapis.com
```

### Using in Scripts

```bash
#!/bin/bash
source ~/.ai-tools-config

echo "🤖 Using: $AI_TOOL ($MODEL)"
# Your automation here...
```

### Running on GCP VMs

Vertex CLI auto-detects GCP Compute Engine VMs and uses service account authentication:

```bash
# On GCP VM - automatic authentication
./enable-ai.sh
```

---

## 🆘 Troubleshooting

<details>
<summary><b>❌ "gcloud: command not found"</b></summary>

Install gcloud CLI:
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
```

</details>

<details>
<summary><b>❌ "jq: command not found"</b></summary>

Install jq:
```bash
brew install jq           # macOS
sudo apt-get install jq   # Ubuntu/Debian
sudo yum install jq       # CentOS/RHEL
```

</details>

<details>
<summary><b>❌ Authentication errors</b></summary>

Re-authenticate:
```bash
gcloud auth application-default login
gcloud auth application-default print-access-token  # Verify
```

</details>

<details>
<summary><b>❌ "API not enabled"</b></summary>

Enable Vertex AI:
```bash
gcloud services enable aiplatform.googleapis.com
```

</details>

<details>
<summary><b>❌ Permission denied</b></summary>

Grant required roles:
```bash
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="user:YOUR_EMAIL" \
  --role="roles/aiplatform.user"
```

</details>

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [Quick Start](QUICKSTART.md) | Get started in 5 minutes |
| [Installation](INSTALL.md) | Detailed setup instructions |
| [Examples](EXAMPLES.md) | Real-world usage examples |
| [Contributing](CONTRIBUTING.md) | How to contribute |
| [Security](SECURITY.md) | Security best practices |
| [Changelog](CHANGELOG.md) | Version history |

---

## 🎨 Examples

### Generate Code

```bash
You: Create a REST API endpoint in Python Flask for user registration

AI: Here's a Flask endpoint for user registration:

from flask import Flask, request, jsonify
from werkzeug.security import generate_password_hash

app = Flask(__name__)

@app.route('/api/register', methods=['POST'])
def register():
    data = request.get_json()

    # Validate input
    if not data.get('email') or not data.get('password'):
        return jsonify({'error': 'Email and password required'}), 400

    # Hash password
    hashed_password = generate_password_hash(data['password'])

    # Store user (implement your database logic)
    user = {
        'email': data['email'],
        'password': hashed_password
    }

    return jsonify({'message': 'User registered successfully'}), 201
```

### Debug Code

```bash
You: Why does this fail? for i in 5: print(i)

AI: The error occurs because you're trying to iterate over an integer (5)
    directly. In Python, you can only iterate over iterable objects.

    Fix:
    for i in range(5):  # range() creates an iterable
        print(i)

    This will print: 0, 1, 2, 3, 4
```

### Explain Concepts

```bash
You: Explain Docker containers in simple terms

AI: Think of Docker containers as lightweight, portable boxes:

    🏠 Traditional VM:    Full house (OS + Apps)
    📦 Docker Container:  Apartment unit (Just your app)

    Benefits:
    • Fast startup (seconds vs minutes)
    • Consistent environments (works everywhere)
    • Resource efficient (share OS kernel)
    • Easy deployment (ship the container)
```

More examples in [EXAMPLES.md](EXAMPLES.md)

---

## 🤝 Contributing

We love contributions! Here's how you can help:

1. 🐛 **Report bugs** via [GitHub Issues](https://github.com/code-wiki/vertex-cli/issues)
2. 💡 **Suggest features** via [GitHub Issues](https://github.com/code-wiki/vertex-cli/issues/new)
3. 🔧 **Submit PRs** - see [CONTRIBUTING.md](CONTRIBUTING.md)
4. ⭐ **Star the repo** if you find it useful!
5. 📢 **Share** with your network

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

**TL;DR:** Free to use, modify, and distribute. No warranties.

---

## 🌟 Support

<div align="center">

### Found this useful? Show some love!

[![Star on GitHub](https://img.shields.io/github/stars/code-wiki/vertex-cli?style=social)](https://github.com/code-wiki/vertex-cli/stargazers)
[![Follow @code-wiki](https://img.shields.io/github/followers/code-wiki?label=Follow&style=social)](https://github.com/code-wiki)

**Get Help:**
- 📖 [Read the docs](QUICKSTART.md)
- 🐛 [Report a bug](https://github.com/code-wiki/vertex-cli/issues)
- 💬 [Ask a question](https://github.com/code-wiki/vertex-cli/issues/new)
- 🌟 [Star the repo](https://github.com/code-wiki/vertex-cli)

</div>

---

<div align="center">

**Built with ❤️ by developers, for developers**

[🏠 Home](https://github.com/code-wiki/vertex-cli) • [📖 Docs](QUICKSTART.md) • [💡 Examples](EXAMPLES.md) • [🤝 Contribute](CONTRIBUTING.md)

</div>

---

<sub>**Disclaimer:** This is an unofficial tool and is not affiliated with Google Cloud, Anthropic, or OpenAI. Use at your own discretion and monitor your cloud costs.</sub>
