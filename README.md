<div align="center">

# 🔮 Vertex CLI

**One interface. All your AI coding assistants.**

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Made with Bash](https://img.shields.io/badge/made%20with-bash-1f425f.svg?style=for-the-badge&logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Stars](https://img.shields.io/github/stars/code-wiki/vertex-cli?style=for-the-badge&logo=github)](https://github.com/code-wiki/vertex-cli/stargazers)

```ascii
┌─────────────────────────────────────────────────────────┐
│  Claude • Gemini • OpenAI — All in your terminal       │
└─────────────────────────────────────────────────────────┘
```

[Quick Start](#-quick-start) • [Installation](#-installation) • [Features](#-features) • [Docs](#-documentation)

</div>

<br>

## 🎯 What is this?

**Vertex CLI** is a unified terminal interface for AI coding assistants. Stop juggling between Claude, Gemini, and OpenAI — access all three from one simple CLI.

<br>

<div align="center">

### ⚡ Three Commands. That's All.

</div>

```bash
git clone https://github.com/code-wiki/vertex-cli.git && cd vertex-cli
./vertex-cli        # Configure your AI provider
./bin/vertex-chat   # Start coding with AI
```

<br>

<div align="center">

## ✨ Features

</div>

<table>
<tbody>
<tr>
<td align="center" width="25%">
<br>
<h3>🤖</h3>
<b>Multi-Provider</b>
<br><br>
Claude, Gemini, OpenAI
<br>
in one tool
<br><br>
</td>
<td align="center" width="25%">
<br>
<h3>⚙️</h3>
<b>Auto-Config</b>
<br><br>
Interactive setup
<br>
wizard
<br><br>
</td>
<td align="center" width="25%">
<br>
<h3>💾</h3>
<b>Persistent</b>
<br><br>
Configure once
<br>
use forever
<br><br>
</td>
<td align="center" width="25%">
<br>
<h3>🔐</h3>
<b>Secure</b>
<br><br>
Keys stored safely
<br>
never exposed
<br><br>
</td>
</tr>
</tbody>
</table>

<br>

## 🚀 Quick Start

### Step 1: Get the Code

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
```

### Step 2: Configure

```bash
./vertex-cli
```

<details>
<summary><b>📋 What you'll see...</b></summary>
<br>

```
================================
   AI Tools Configuration
================================

1) Configure Claude (Vertex AI)
2) Configure Gemini (Vertex AI)
3) Configure OpenAI
4) Show current configuration
5) Test configuration
6) Launch AI chat interface
7) Exit
```

</details>

### Step 3: Start Chatting

```bash
./bin/vertex-chat
```

<details>
<summary><b>💬 Example conversation...</b></summary>
<br>

```python
You: Write a function to reverse a linked list

AI: Here's an efficient iterative solution:

def reverse_linked_list(head):
    prev = None
    current = head

    while current:
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node

    return prev

# Time: O(n), Space: O(1)
```

</details>

<br>

## 📦 Installation

<table>
<tr>
<td width="50%">

### Option 1: Run Directly

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./vertex-cli
```

No installation needed. Just run.

</td>
<td width="50%">

### Option 2: Install Globally

```bash
make install
```

Then use anywhere:

```bash
vertex-cli
vertex-chat
```

</td>
</tr>
</table>

<br>

## 🔧 Prerequisites

<table>
<tr>
<th width="50%">For Claude & Gemini</th>
<th width="50%">For OpenAI</th>
</tr>
<tr>
<td valign="top">

• GCP account
• [gcloud CLI](https://cloud.google.com/sdk/docs/install)
• `jq` processor

```bash
# macOS
brew install jq google-cloud-sdk

# Ubuntu/Debian
sudo apt-get install jq
curl https://sdk.cloud.google.com | bash
```

</td>
<td valign="top">

• OpenAI API key
• `jq` processor

```bash
# macOS
brew install jq

# Ubuntu/Debian
sudo apt-get install jq
```

</td>
</tr>
</table>

<br>

## 🎨 Configuration

Your settings live in `~/.ai-tools-config`:

```bash
AI_TOOL=claude
PROJECT_ID=my-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
```

<br>

<div align="center">

### 🤖 Available Models

</div>

<table align="center">
<tr>
<td align="center"><b>Claude</b></td>
<td align="center"><b>Gemini</b></td>
<td align="center"><b>OpenAI</b></td>
</tr>
<tr>
<td>

`claude-3-5-sonnet@20240620` ⭐
`claude-3-opus@20240229`
`claude-3-haiku@20240307`

</td>
<td>

`gemini-2.0-flash-exp` ⚡
`gemini-1.5-pro`
`gemini-1.5-flash`

</td>
<td>

`gpt-4o`
`gpt-4-turbo`
`gpt-3.5-turbo`

</td>
</tr>
</table>

<br>

## 💡 Use Cases

<table>
<tr>
<td width="50%" valign="top">

### 📝 Code Generation

```bash
You: Create a REST API endpoint

AI: [Generates complete Flask/FastAPI code]
```

### 🐛 Debugging

```bash
You: Why is this throwing TypeError?

AI: [Explains and provides fix]
```

</td>
<td width="50%" valign="top">

### 🔍 Code Review

```bash
You: Review this for security issues

AI: [Analyzes and suggests improvements]
```

### 📚 Documentation

```bash
You: Write docstrings for this module

AI: [Generates comprehensive docs]
```

</td>
</tr>
</table>

<br>

## ⚙️ Advanced

<details>
<summary><b>🔌 Script Integration</b></summary>
<br>

```bash
#!/bin/bash
source ~/.ai-tools-config

echo "Using: $AI_TOOL ($MODEL)"
# Your code here
```

</details>

<details>
<summary><b>☁️ GCP VM Usage</b></summary>
<br>

Auto-detects GCP VMs and uses service account authentication.

```bash
vertex-cli  # Just works on GCP VMs
```

</details>

<details>
<summary><b>🔄 Switch Providers</b></summary>
<br>

```bash
vertex-cli  # Run again to reconfigure
```

</details>

<br>

## 🆘 Troubleshooting

<details>
<summary><code>gcloud: command not found</code></summary>

```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

</details>

<details>
<summary><code>jq: command not found</code></summary>

```bash
brew install jq              # macOS
sudo apt-get install jq      # Ubuntu/Debian
sudo yum install jq          # CentOS/RHEL
```

</details>

<details>
<summary><code>API not enabled</code></summary>

```bash
gcloud services enable aiplatform.googleapis.com
```

</details>

<details>
<summary><code>Authentication failed</code></summary>

```bash
gcloud auth application-default login
```

</details>

<br>

## 📚 Documentation

<div align="center">

| Guide | Description |
|-------|-------------|
| [📖 Quick Start](docs/QUICKSTART.md) | Get started in 5 minutes |
| [⚙️ Installation](docs/INSTALL.md) | Detailed setup guide |
| [💡 Examples](docs/EXAMPLES.md) | Real-world usage |
| [🏗️ Architecture](docs/ARCHITECTURE.md) | System design |
| [🤝 Contributing](docs/CONTRIBUTING.md) | Contribution guide |
| [🔒 Security](docs/SECURITY.md) | Security practices |

</div>

<br>

## 🤝 Contributing

Contributions make this project better!

<div align="center">

| | |
|:---:|:---|
| 🐛 | [Report a bug](https://github.com/code-wiki/vertex-cli/issues) |
| 💡 | [Request a feature](https://github.com/code-wiki/vertex-cli/issues/new) |
| 🔧 | [Submit a pull request](docs/CONTRIBUTING.md) |
| ⭐ | [Star the repository](https://github.com/code-wiki/vertex-cli/stargazers) |

</div>

<br>

## 📜 License

MIT License — free to use, modify, and distribute.

See [LICENSE](LICENSE) for full details.

<br>

<div align="center">

## ⭐ Support This Project

<a href="https://github.com/code-wiki/vertex-cli/stargazers">
  <img src="https://img.shields.io/github/stars/code-wiki/vertex-cli?style=for-the-badge&logo=github&color=yellow" alt="Star on GitHub"/>
</a>

<br><br>

**Need help?**

[📖 Read the Docs](docs/QUICKSTART.md) •
[🐛 Report Issue](https://github.com/code-wiki/vertex-cli/issues) •
[💬 Start Discussion](https://github.com/code-wiki/vertex-cli/discussions)

<br><br>

---

<br>

Built with ❤️ by developers, for developers

<br>

<sub>Not affiliated with Google Cloud, Anthropic, or OpenAI</sub>

</div>

<br>
