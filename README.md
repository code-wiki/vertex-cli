<div align="center">

<h1>
  <img src="https://raw.githubusercontent.com/code-wiki/vertex-cli/main/assets/logo.svg" alt="Vertex CLI" width="80" height="80" />
  <br/>
  Vertex CLI
</h1>

<p align="center">
  <strong>One interface. Three AI giants. Infinite possibilities.</strong>
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a> ·
  <a href="#installation">Installation</a> ·
  <a href="#documentation">Documentation</a> ·
  <a href="#examples">Examples</a>
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License"></a>
  <a href="https://www.gnu.org/software/bash/"><img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg?style=flat-square" alt="Bash"></a>
  <a href="https://github.com/code-wiki/vertex-cli/stargazers"><img src="https://img.shields.io/github/stars/code-wiki/vertex-cli?style=flat-square" alt="Stars"></a>
</p>

<br/>

</div>

## What is Vertex CLI?

A unified command-line interface for accessing **Claude**, **Gemini**, and **OpenAI** from your terminal. Stop juggling between different tools, APIs, and configurations.

<br/>

<div align="center">

### Why Use This?

</div>

<table>
<tr>
<td align="center" width="33%">
<img src="https://via.placeholder.com/60/4A90E2/FFFFFF?text=⚡" width="60" alt="Fast"/>
<br/><br/>
<strong>Blazing Fast</strong>
<br/><br/>
Configure once, use forever.<br/>No browser, no GUI.
</td>
<td align="center" width="33%">
<img src="https://via.placeholder.com/60/7ED321/FFFFFF?text=🔄" width="60" alt="Unified"/>
<br/><br/>
<strong>Unified Interface</strong>
<br/><br/>
One CLI for all providers.<br/>Seamless switching.
</td>
<td align="center" width="33%">
<img src="https://via.placeholder.com/60/F5A623/FFFFFF?text=🎯" width="60" alt="Simple"/>
<br/><br/>
<strong>Dead Simple</strong>
<br/><br/>
Three commands to start.<br/>That's it.
</td>
</tr>
</table>

<br/>

---

<br/>

## Quick Start

<div align="center">

```bash
# Clone
git clone https://github.com/code-wiki/vertex-cli.git && cd vertex-cli

# Configure
./vertex-cli

# Start chatting
./bin/vertex-chat
```

</div>

<br/>

**That's literally it.** You're now coding with AI.

<br/>

---

<br/>

## Features

<div align="center">

| | |
|:---:|:---|
| **🤖** | **Multi-Provider** — Claude, Gemini, OpenAI in one tool |
| **⚙️** | **Auto-Configuration** — Interactive setup wizard |
| **💾** | **Persistent Settings** — Configure once, use everywhere |
| **☁️** | **Cloud Ready** — Works on local machines and GCP VMs |
| **🔐** | **Secure** — API keys stored safely, never exposed |
| **🎨** | **Customizable** — Use any model, any region |

</div>

<br/>

---

<br/>

## Installation

### Option 1: Run Directly

```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./vertex-cli
```

### Option 2: Install Globally

```bash
make install
vertex-cli  # Available system-wide
```

<br/>

---

<br/>

## Usage

<div align="center">

### Configure Your Provider

</div>

```bash
vertex-cli
```

<div align="center">

Choose from the menu:

</div>

```
1) Configure Claude (Vertex AI)
2) Configure Gemini (Vertex AI)
3) Configure OpenAI
```

<br/>

<div align="center">

### Start Coding with AI

</div>

```bash
vertex-chat
```

<div align="center">

**Example conversation:**

</div>

```python
You: Write a function to merge two sorted arrays

AI: Here's an efficient solution using two pointers:

def merge_sorted_arrays(arr1, arr2):
    result = []
    i = j = 0

    while i < len(arr1) and j < len(arr2):
        if arr1[i] <= arr2[j]:
            result.append(arr1[i])
            i += 1
        else:
            result.append(arr2[j])
            j += 1

    result.extend(arr1[i:])
    result.extend(arr2[j:])
    return result

# Time: O(n+m), Space: O(n+m)
```

<br/>

---

<br/>

## Prerequisites

<div align="center">

### For Claude & Gemini

</div>

- GCP account with Vertex AI enabled
- [gcloud CLI](https://cloud.google.com/sdk/docs/install)
- `jq` JSON processor

<div align="center">

### For OpenAI

</div>

- OpenAI API key
- `jq` JSON processor

<br/>

<div align="center">

### Quick Setup

</div>

```bash
# macOS
brew install jq google-cloud-sdk

# Ubuntu/Debian
sudo apt-get install jq && curl https://sdk.cloud.google.com | bash

# Configure GCP
gcloud auth login
gcloud auth application-default login
gcloud services enable aiplatform.googleapis.com
```

<br/>

---

<br/>

## Configuration

Settings live in `~/.ai-tools-config`:

```bash
AI_TOOL=claude
PROJECT_ID=my-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
```

<div align="center">

**Available Models**

</div>

<table align="center">
<tr>
<th>Provider</th>
<th>Models</th>
</tr>
<tr>
<td><strong>Claude</strong></td>
<td>
<code>claude-3-5-sonnet@20240620</code><br/>
<code>claude-3-opus@20240229</code><br/>
<code>claude-3-haiku@20240307</code>
</td>
</tr>
<tr>
<td><strong>Gemini</strong></td>
<td>
<code>gemini-2.0-flash-exp</code><br/>
<code>gemini-1.5-pro</code><br/>
<code>gemini-1.5-flash</code>
</td>
</tr>
<tr>
<td><strong>OpenAI</strong></td>
<td>
<code>gpt-4o</code><br/>
<code>gpt-4-turbo</code><br/>
<code>gpt-3.5-turbo</code>
</td>
</tr>
</table>

<br/>

---

<br/>

## Use Cases

<table>
<tr>
<td width="50%">

**Code Generation**

```bash
You: Create a binary search tree
AI: [Generates complete BST implementation]
```

**Debugging**

```bash
You: Why is this throwing null pointer?
AI: [Analyzes and explains the issue]
```

</td>
<td width="50%">

**Code Review**

```bash
You: Review this for security issues
AI: [Identifies vulnerabilities]
```

**Documentation**

```bash
You: Write API docs for this function
AI: [Generates comprehensive docs]
```

</td>
</tr>
</table>

<br/>

---

<br/>

## Advanced

<details>
<summary><strong>Script Integration</strong></summary>

<br/>

```bash
#!/bin/bash
source ~/.ai-tools-config
echo "Using: $AI_TOOL ($MODEL)"
```

</details>

<details>
<summary><strong>GCP VM Usage</strong></summary>

<br/>

Auto-detects GCP VMs and uses service account authentication.

```bash
vertex-cli  # Just works on GCP VMs
```

</details>

<details>
<summary><strong>Provider Switching</strong></summary>

<br/>

```bash
vertex-cli  # Run again to change provider
```

</details>

<br/>

---

<br/>

## Troubleshooting

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
brew install jq           # macOS
sudo apt-get install jq   # Ubuntu
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

<br/>

---

<br/>

## Documentation

<div align="center">

| Guide | Description |
|:------|:------------|
| [Quick Start](docs/QUICKSTART.md) | Get started in 5 minutes |
| [Installation](docs/INSTALL.md) | Detailed setup instructions |
| [Examples](docs/EXAMPLES.md) | Real-world usage examples |
| [Architecture](docs/ARCHITECTURE.md) | System design documentation |
| [Contributing](docs/CONTRIBUTING.md) | How to contribute |
| [Security](docs/SECURITY.md) | Security best practices |

</div>

<br/>

---

<br/>

## Contributing

We ❤️ contributions!

<div align="center">

| | |
|:---:|:---|
| 🐛 | [Report bugs](https://github.com/code-wiki/vertex-cli/issues) |
| 💡 | [Suggest features](https://github.com/code-wiki/vertex-cli/issues/new) |
| 🔧 | [Submit pull requests](docs/CONTRIBUTING.md) |
| ⭐ | [Star the repo](https://github.com/code-wiki/vertex-cli/stargazers) |

</div>

<br/>

---

<br/>

<div align="center">

## Support

<br/>

<a href="https://github.com/code-wiki/vertex-cli/stargazers">
  <img src="https://img.shields.io/github/stars/code-wiki/vertex-cli?style=for-the-badge&logo=github" alt="Star on GitHub"/>
</a>

<br/><br/>

**Need help?**

[📖 Documentation](docs/QUICKSTART.md) ·
[🐛 Report Issue](https://github.com/code-wiki/vertex-cli/issues) ·
[💬 Discussions](https://github.com/code-wiki/vertex-cli/discussions)

<br/><br/>

---

<br/>

<sub>Built with ❤️ for developers</sub>

<br/>

<sub>MIT License · Not affiliated with Google, Anthropic, or OpenAI</sub>

</div>
