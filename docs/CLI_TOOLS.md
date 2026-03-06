# CLI Tools Installation Guide

Official CLI tools for Claude and Gemini that can be installed and managed through Vertex CLI.

## 🚀 Quick Access

From Vertex CLI main menu:
- **Option 7**: Install/Manage Claude CLI
- **Option 8**: Install/Manage Gemini CLI

---

## 📦 Claude CLI

### About
- **Name**: Claude Code
- **Provider**: Anthropic (Official)
- **Package**: `@anthropic-ai/claude-code`
- **Version**: 2.1.70+
- **Requirements**: Node.js, npm

### Features
- Direct access to Claude models
- Code editing and analysis
- Terminal-based interface
- Official Anthropic tool

### Installation

#### Via Vertex CLI (Recommended)
```bash
./vertex-cli
# Select option 7 (Install/Manage Claude CLI)
```

#### Manual Installation
```bash
npm install -g @anthropic-ai/claude-code
```

### Usage
```bash
# Launch Claude CLI
claude

# Check version
claude --version

# Get help
claude --help
```

### Configuration
Claude CLI requires authentication. Visit:
https://code.claude.com/docs

### Documentation
- Official Docs: https://code.claude.com/docs
- GitHub: https://github.com/anthropics/claude-code

---

## 📦 Gemini CLI

### About
- **Name**: Gemini CLI
- **Provider**: Google (Official)
- **Package**: `@google/gemini-cli`
- **Version**: 0.32.1+
- **Requirements**: Node.js, npm

### Features
- Direct access to Gemini models
- Generative AI capabilities
- Terminal-based interface
- Official Google tool

### Installation

#### Via Vertex CLI (Recommended)
```bash
./vertex-cli
# Select option 8 (Install/Manage Gemini CLI)
```

#### Manual Installation
```bash
npm install -g @google/gemini-cli
```

### Usage
```bash
# Launch Gemini CLI
gemini

# Check version
gemini --version

# Get help
gemini --help
```

### Configuration
Gemini CLI requires an API key. Get yours at:
https://makersuite.google.com/app/apikey

### Documentation
- Official Docs: https://github.com/google/generative-ai-js
- API Docs: https://ai.google.dev/docs

---

## 🔧 Management Options

### Update
Keep your CLI tools up to date:
```bash
./vertex-cli
# Select option 7 or 8
# Choose option 1 (Update to latest version)
```

### Reinstall
If experiencing issues:
```bash
./vertex-cli
# Select option 7 or 8
# Choose option 2 (Reinstall)
```

### Uninstall
Remove CLI tools:
```bash
./vertex-cli
# Select option 7 or 8
# Choose option 3 (Uninstall)
```

---

## 🆚 CLI Tools vs Vertex AI

### Claude CLI
- ✅ Official Anthropic CLI
- ✅ Direct API access
- ✅ Code editing features
- ❌ Requires separate API key
- ❌ Different from Vertex AI integration

### Gemini CLI  
- ✅ Official Google CLI
- ✅ Direct API access
- ✅ Generative AI features
- ❌ Requires separate API key
- ❌ Different from Vertex AI integration

### Vertex AI (via vertex-chat)
- ✅ Uses GCP Vertex AI
- ✅ Unified billing
- ✅ Enterprise features
- ✅ No separate API keys
- ✅ Multi-model support (Claude + Gemini + OpenAI)

---

## 💡 When to Use Each

### Use Claude CLI When:
- You want official Anthropic tooling
- You need code editing capabilities
- You have a Claude API key
- You prefer Anthropic's direct API

### Use Gemini CLI When:
- You want official Google tooling
- You need generative AI features
- You have a Gemini API key
- You prefer Google's direct API

### Use Vertex AI (vertex-chat) When:
- You want unified GCP billing
- You need multiple AI models
- You prefer enterprise features
- You want simplified authentication
- You need Claude + Gemini + OpenAI in one tool

---

## ⚠️ Prerequisites

### Node.js & npm
Both CLIs require Node.js and npm:

**macOS:**
```bash
brew install node
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install nodejs npm
```

**Linux (CentOS/RHEL):**
```bash
sudo yum install nodejs npm
```

**Windows:**
- Download from: https://nodejs.org
- Or use Chocolatey: `choco install nodejs`

### Verify Installation
```bash
node --version
npm --version
```

---

## 🔍 Troubleshooting

### Permission Errors
If you get EACCES errors:
```bash
# Option 1: Use npx
npx @anthropic-ai/claude-code
npx @google/gemini-cli

# Option 2: Fix npm permissions
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### Command Not Found
After installation, if command is not found:
```bash
# Reload your shell
exec $SHELL

# Or add to PATH manually
export PATH="$PATH:$(npm bin -g)"
```

### Version Conflicts
If experiencing issues:
```bash
# Clear npm cache
npm cache clean --force

# Reinstall via Vertex CLI
./vertex-cli
# Select option 7 or 8, then reinstall
```

---

## 📋 Comparison Table

| Feature | Claude CLI | Gemini CLI | Vertex AI |
|---------|-----------|-----------|-----------|
| Provider | Anthropic | Google | GCP (Multi) |
| Installation | npm | npm | Built-in |
| Authentication | API Key | API Key | GCP Auth |
| Billing | Separate | Separate | GCP Unified |
| Models | Claude only | Gemini only | Claude+Gemini+OpenAI |
| Enterprise | No | No | Yes |
| Code Editing | Yes | No | No |
| Multi-Model | No | No | Yes |

---

## 🔗 Resources

### Claude CLI
- Documentation: https://code.claude.com/docs
- Support: https://support.anthropic.com
- API Keys: https://console.anthropic.com

### Gemini CLI
- Documentation: https://ai.google.dev/docs
- Support: https://developers.google.com/generative-ai
- API Keys: https://makersuite.google.com/app/apikey

### Vertex CLI
- GitHub: https://github.com/code-wiki/vertex-cli
- Issues: https://github.com/code-wiki/vertex-cli/issues

---

## 📝 License

Both CLIs are provided by their respective companies:
- Claude CLI: © Anthropic PBC
- Gemini CLI: © Google LLC

This installation guide is part of the open-source Vertex CLI project.

---

**Last Updated**: 2026-03-06
