<div align="center">

# 🔮 Vertex CLI

**One interface. All your AI coding assistants.**

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Made with Bash](https://img.shields.io/badge/made%20with-bash-1f425f.svg?style=for-the-badge&logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Stars](https://img.shields.io/github/stars/code-wiki/vertex-cli?style=for-the-badge&logo=github)](https://github.com/code-wiki/vertex-cli/stargazers)
  
```ascii
                        ┌─────────────────────────────────────────────────────────┐
                        │  Claude • Gemini • OpenAI — All in your terminal        │
                        └─────────────────────────────────────────────────────────┘
```

[Quick Start](#-quick-start) • [Installation](#-installation) • [Features](#-features) • [Docs](#-documentation)

</div>

<br>

## 🎯 What is this?

**Vertex CLI** is a unified terminal interface for AI coding assistants. Stop juggling between Claude, Gemini, and OpenAI — access all three from one simple CLI.

<br>

<div align="left">

### ⚡ Three Commands. That's All.

</div>

```bash
git clone https://github.com/code-wiki/vertex-cli.git && cd vertex-cli
./vertex-cli        # Configure your AI provider
./bin/vertex-chat   # Start coding with AI
```

<br>

<div align="left">

## ✨ Features

</div>

<table>
<tbody>
<tr>
<td align="center" width="20%">
<br>
<h3>🤖</h3>
<b>Multi-Provider</b>
<br><br>
Claude, Gemini, OpenAI
<br>
in one tool
<br><br>
</td>
<td align="center" width="20%">
<br>
<h3>📦</h3>
<b>CLI Tools</b>
<br><br>
Install & manage
<br>
official CLIs
<br><br>
</td>
<td align="center" width="20%">
<br>
<h3>⚙️</h3>
<b>Auto-Config</b>
<br><br>
Interactive setup
<br>
wizard
<br><br>
</td>
<td align="center" width="20%">
<br>
<h3>💾</h3>
<b>Persistent</b>
<br><br>
Configure once
<br>
use forever
<br><br>
</td>
<td align="center" width="20%">
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

## Installation by Platform

### 🐧 Linux (Ubuntu/Debian/CentOS/RHEL)

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
chmod +x install.sh
./install.sh
./vertex-cli
```

### 🍎 macOS

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
chmod +x install.sh
./install.sh
./vertex-cli
```

### 🪟 Windows

**Option 1: Git Bash (Recommended)**
```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
bash install.sh
bash vertex-cli
```

**Option 2: PowerShell**
```powershell
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
.\vertex-cli.ps1
```

**Option 3: Command Prompt**
```cmd
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
vertex-cli.bat
```

**Option 4: WSL (Windows Subsystem for Linux)**
```bash
wsl --install  # If not already installed
wsl
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./install.sh
./vertex-cli
```

<details>
<summary><b>📋 What you'll see...</b></summary>
<br>

```
╔══════════════════════════════════════════════════════════╗
║              🔮 VERTEX CLI - MAIN MENU                  ║
╚══════════════════════════════════════════════════════════╝

🤖 AI Configuration:
  1) Configure Claude (Vertex AI)
  2) Configure Gemini (Vertex AI)
  3) Configure OpenAI

🔐 GCP Management:
  4) Authenticate with GCP
  5) Switch Account
  6) Manage Projects & APIs

📦 CLI Tools:
  7) Install/Manage Claude CLI
  8) Install/Manage Gemini CLI

📊 Status & Testing:
  9) Show Configuration
  10) Test Configuration

💬 Usage:
  11) Launch Chat Interface

  0) Exit
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

### Automated Installation

**All Platforms:**
```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./install.sh  # Linux/macOS
# OR
bash install.sh  # Windows Git Bash
```

The installer will:
- Detect your operating system
- Install required dependencies (curl, jq, gcloud)
- Configure scripts
- Set up the environment

### Manual Installation

<table>
<tr>
<th width="50%">Unix/Linux/macOS</th>
<th width="50%">Windows</th>
</tr>
<tr>
<td valign="top">

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
chmod +x vertex-cli bin/*
./vertex-cli
```

</td>
<td valign="top">

**Git Bash:**
```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
bash vertex-cli
```

**PowerShell:**
```powershell
.\vertex-cli.ps1
```

**CMD:**
```cmd
vertex-cli.bat
```

</td>
</tr>
</table>

<br>

## 🔧 Prerequisites

### All Platforms
- Git
- Bash (included in Linux/macOS, Git Bash for Windows)
- curl
- jq (JSON processor)

### For Claude & Gemini (Vertex AI)
- GCP account with billing enabled
- [gcloud CLI](https://cloud.google.com/sdk/docs/install)

### For OpenAI
- OpenAI API key

---

## Platform-Specific Setup

<table>
<tr>
<th>Linux (Ubuntu/Debian)</th>
<th>Linux (CentOS/RHEL)</th>
</tr>
<tr>
<td valign="top">

```bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y curl jq

# Install gcloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
```

</td>
<td valign="top">

```bash
# Install dependencies
sudo yum install -y curl jq

# Install gcloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
```

</td>
</tr>
</table>

<table>
<tr>
<th>macOS</th>
<th>Windows</th>
</tr>
<tr>
<td valign="top">

```bash
# Install Homebrew (if needed)
/bin/bash -c "$(curl -fsSL \
  https://raw.githubusercontent.com/\
Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install jq google-cloud-sdk

# Initialize gcloud
gcloud init
```

</td>
<td valign="top">

**Install:**
1. [Git Bash](https://git-scm.com/download/win)
2. [Google Cloud SDK](https://cloud.google.com/sdk/docs/install#windows)
3. [jq](https://stedolan.github.io/jq/download/)

**Or use WSL:**
```powershell
wsl --install
```

Then follow Linux instructions in WSL.

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

<div align="left">

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

**14 models available!** ⭐
`claude-sonnet-4-6`
`claude-opus-4-6`
`claude-opus-4-5`
`claude-haiku-4-5`
`claude-sonnet-4-5`
... and 9 more

[📖 See all models](docs/CLAUDE_MODELS.md)

</td>
<td>

`gemini-2.5-flash` ⚡
`gemini-2.5-pro`
`gemini-2.0-flash-exp`
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

<div align="left">

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

<div align="left">

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

<br>

**Need help?**

[📖 Read the Docs](docs/QUICKSTART.md) •
[🐛 Report Issue](https://github.com/code-wiki/vertex-cli/issues) •
[💬 Start Discussion](https://github.com/code-wiki/vertex-cli/discussions)

<br>

Built with ❤️ by developers, for developers
<br>

<sub>Not affiliated with Google Cloud, Anthropic, or OpenAI</sub>

</div>

<br>
