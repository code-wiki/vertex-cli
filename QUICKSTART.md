# Quick Start Guide

Get started with GCP AI Tools Runner in 5 minutes!

## Super Quick Start (For GCP Users)

```bash
# 1. Clone the repo
git clone https://github.com/yourusername/gcp-ai-tools-runner.git
cd gcp-ai-tools-runner

# 2. Run setup
./setup.sh

# 3. Configure your AI tool
./enable-ai.sh

# 4. Start chatting!
./chat.sh
```

## Detailed Quick Start

### Step 1: Install Prerequisites (2 minutes)

**macOS:**
```bash
# Install Homebrew if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install jq
brew install jq

# Install gcloud
brew install --cask google-cloud-sdk
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get update
sudo apt-get install -y git jq curl

# Install gcloud
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

### Step 2: Set Up GCP (2 minutes)

```bash
# Login to GCP
gcloud auth login

# Set up application credentials
gcloud auth application-default login

# Set your project
gcloud config set project YOUR_PROJECT_ID

# Enable Vertex AI
gcloud services enable aiplatform.googleapis.com
```

### Step 3: Install the Tool (1 minute)

```bash
# Clone
git clone https://github.com/yourusername/gcp-ai-tools-runner.git
cd gcp-ai-tools-runner

# Run automated setup
chmod +x setup.sh
./setup.sh
```

### Step 4: Configure & Use (30 seconds)

```bash
# Start configuration
./enable-ai.sh

# Select 1 (Configure Claude) or 2 (Configure Gemini)
# Press Enter to use defaults
# Select 6 (Launch AI chat interface)

# Or run chat directly
./chat.sh
```

## First Conversation Example

```bash
$ ./chat.sh
================================
   AI Chat Interface (claude)
================================

Chat started. Type 'exit' or 'quit' to end the session.
Using: claude (claude-3-5-sonnet@20240620)

You: Write a hello world in Python
AI: Here's a simple Hello World in Python:

```python
print("Hello, World!")
```

You can also make it more interactive:

```python
name = input("What's your name? ")
print(f"Hello, {name}!")
```

You: exit
Goodbye!
```

## Using OpenAI Instead

```bash
./enable-ai.sh

# Select 3 (Configure OpenAI)
# Enter your OpenAI API key
# Press Enter for defaults
# Select 6 to launch chat
```

## What's Next?

- Read [EXAMPLES.md](EXAMPLES.md) for more usage examples
- Check [README.md](README.md) for detailed features
- See [INSTALL.md](INSTALL.md) for troubleshooting
- Review [SECURITY.md](SECURITY.md) for best practices

## Common Issues & Quick Fixes

**"gcloud: command not found"**
```bash
# Install gcloud CLI
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

**"jq: command not found"**
```bash
brew install jq  # macOS
sudo apt-get install jq  # Linux
```

**"API not enabled"**
```bash
gcloud services enable aiplatform.googleapis.com
```

**"Permission denied"**
```bash
chmod +x enable-ai.sh chat.sh setup.sh
```

## Tips for Success

1. **Start with free credits**: GCP gives $300 free credits to new users
2. **Use Vertex AI first**: Try Claude or Gemini on GCP Vertex AI before using OpenAI
3. **Monitor costs**: Set up billing alerts in GCP Console
4. **Keep it updated**: Pull latest changes regularly with `git pull`

## Need Help?

- 📖 Read the [full documentation](README.md)
- 🐛 [Report bugs](https://github.com/yourusername/gcp-ai-tools-runner/issues)
- 💡 [Request features](https://github.com/yourusername/gcp-ai-tools-runner/issues/new)
- ⭐ [Star the repo](https://github.com/yourusername/gcp-ai-tools-runner) if you find it useful!

---

**Happy coding with AI! 🚀**
