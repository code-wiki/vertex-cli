# Installation Guide

Complete installation guide for Vertex CLI.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Quick Install](#quick-install)
- [Detailed Setup](#detailed-setup)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## Prerequisites

### Required Software

1. **Bash Shell** (pre-installed on Linux/macOS)
   - Version 4.0 or higher recommended

2. **curl** (pre-installed on most systems)
   ```bash
   # Verify installation
   curl --version
   ```

3. **jq** (JSON processor)
   ```bash
   # macOS
   brew install jq

   # Ubuntu/Debian
   sudo apt-get update && sudo apt-get install -y jq

   # CentOS/RHEL
   sudo yum install -y jq

   # Arch Linux
   sudo pacman -S jq
   ```

### For GCP Vertex AI (Claude & Gemini)

1. **Google Cloud Account**
   - Sign up at [cloud.google.com](https://cloud.google.com)
   - New users get $300 free credits

2. **gcloud CLI**

   **macOS:**
   ```bash
   # Using Homebrew
   brew install --cask google-cloud-sdk

   # Or download installer
   curl https://sdk.cloud.google.com | bash
   exec -l $SHELL
   ```

   **Linux:**
   ```bash
   # Debian/Ubuntu
   echo "deb [signed-by=/usr/share/keyrings/cloud.google-gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google-gpg add -
   sudo apt-get update && sudo apt-get install google-cloud-sdk

   # Or using snap
   sudo snap install google-cloud-sdk --classic
   ```

   **Verify installation:**
   ```bash
   gcloud --version
   ```

### For OpenAI

1. **OpenAI Account**
   - Sign up at [platform.openai.com](https://platform.openai.com)
   - Get API key from [platform.openai.com/api-keys](https://platform.openai.com/api-keys)

## Quick Install

```bash
# Clone the repository
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli

# Make scripts executable
chmod +x enable-ai.sh chat.sh

# Run the setup
./enable-ai.sh
```

## Detailed Setup

### Step 1: Clone Repository

```bash
# Using HTTPS
git clone https://github.com/code-wiki/vertex-cli.git

# Or using SSH
git clone git@github.com:code-wiki/vertex-cli.git

cd vertex-cli
```

### Step 2: Configure GCP (for Vertex AI)

```bash
# Initialize gcloud (if first time)
gcloud init

# Or login to existing account
gcloud auth login

# Set your project
gcloud config set project YOUR_PROJECT_ID

# Enable required APIs
gcloud services enable aiplatform.googleapis.com

# Set up application default credentials
gcloud auth application-default login
```

### Step 3: Create GCP Project (if needed)

```bash
# Create new project
gcloud projects create YOUR_PROJECT_ID --name="AI Tools Project"

# Set as active project
gcloud config set project YOUR_PROJECT_ID

# Link billing account (required for API usage)
gcloud billing accounts list
gcloud billing projects link YOUR_PROJECT_ID --billing-account=BILLING_ACCOUNT_ID
```

### Step 4: Set Permissions

```bash
# Get your user email
gcloud config get-value account

# Grant Vertex AI User role
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
    --member="user:YOUR_EMAIL" \
    --role="roles/aiplatform.user"
```

### Step 5: Run the Tool

```bash
# Make scripts executable (if not already done)
chmod +x enable-ai.sh chat.sh

# Run setup
./enable-ai.sh
```

## Verification

### Verify gcloud Setup

```bash
# Check authentication
gcloud auth list

# Check project
gcloud config get-value project

# Check enabled APIs
gcloud services list --enabled | grep aiplatform

# Test access token generation
gcloud auth application-default print-access-token
```

### Verify Tool Installation

```bash
# Run the tool
./enable-ai.sh

# Select option 4 (Show current configuration)
# Select option 5 (Test configuration)
```

## Installation on GCP VM

If you're running this on a GCP VM:

```bash
# SSH into your VM
gcloud compute ssh YOUR_VM_NAME

# Install prerequisites
sudo apt-get update
sudo apt-get install -y git jq

# Clone repository
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli

# Make scripts executable
chmod +x enable-ai.sh chat.sh

# Run (no need for gcloud auth on GCP VM with proper service account)
./enable-ai.sh
```

### GCP VM Service Account Setup

```bash
# Create service account
gcloud iam service-accounts create ai-tools-runner \
    --display-name="AI Tools Runner"

# Grant necessary roles
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
    --member="serviceAccount:ai-tools-runner@YOUR_PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/aiplatform.user"

# Create VM with service account
gcloud compute instances create ai-tools-vm \
    --service-account=ai-tools-runner@YOUR_PROJECT_ID.iam.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform
```

## Troubleshooting

### Common Issues

**Issue: "gcloud: command not found"**
```bash
# Solution: Install gcloud CLI (see prerequisites)
# After installation, restart terminal
exec -l $SHELL
```

**Issue: "jq: command not found"**
```bash
# Solution: Install jq
brew install jq  # macOS
sudo apt-get install jq  # Linux
```

**Issue: "API not enabled"**
```bash
# Solution: Enable Vertex AI API
gcloud services enable aiplatform.googleapis.com
```

**Issue: "Permission denied"**
```bash
# Solution: Make scripts executable
chmod +x enable-ai.sh chat.sh
```

**Issue: "Authentication failed"**
```bash
# Solution: Re-authenticate
gcloud auth login
gcloud auth application-default login
```

**Issue: "Project not set"**
```bash
# Solution: Set project
gcloud config set project YOUR_PROJECT_ID
```

### Getting Help

If you encounter issues:
1. Check the [GitHub Issues](https://github.com/code-wiki/vertex-cli/issues)
2. Review [SECURITY.md](SECURITY.md) for security-related issues
3. Create a new issue with:
   - Your OS and version
   - gcloud version (`gcloud --version`)
   - Error messages
   - Steps to reproduce

## Next Steps

After installation:
1. Read the [README.md](README.md) for usage instructions
2. Review [SECURITY.md](SECURITY.md) for security best practices
3. Check [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute

## Uninstallation

To remove the tool:

```bash
# Remove configuration
rm ~/.ai-tools-config

# Remove repository
cd ..
rm -rf vertex-cli

# (Optional) Revoke gcloud credentials
gcloud auth revoke
```

---

**Need more help?** Open an issue on [GitHub](https://github.com/code-wiki/vertex-cli/issues)
