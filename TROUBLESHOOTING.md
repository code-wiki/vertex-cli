# 🔧 Troubleshooting Guide

## GCP Authentication Issues

### Problem: "Not authenticated with GCP"

**Solution:**
```bash
gcloud auth application-default login
```

This opens your browser and authenticates you with GCP.

### Problem: "gcloud: command not found"

**Solution:**

**macOS:**
```bash
brew install google-cloud-sdk
```

**Ubuntu/Debian:**
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

**After installation:**
```bash
gcloud init
gcloud auth application-default login
```

### Problem: "No project set"

**Solution:**
```bash
gcloud config set project YOUR_PROJECT_ID
```

Or during configuration, enter your project ID when prompted.

### Problem: "API not enabled"

**Solution:**
```bash
gcloud services enable aiplatform.googleapis.com --project=YOUR_PROJECT_ID
```

## Quick Setup Steps

1. **Install gcloud CLI** (if not installed)
2. **Initialize gcloud:**
   ```bash
   gcloud init
   ```
3. **Authenticate:**
   ```bash
   gcloud auth application-default login
   ```
4. **Run Vertex CLI:**
   ```bash
   ./vertex-cli
   ```
5. **Select option 1 or 2** (Claude or Gemini)
6. **Start chatting:**
   ```bash
   ./bin/vertex-chat
   ```

## Common Errors

### "Authentication failed"
- Run: `gcloud auth application-default login`
- Ensure you have access to the GCP project

### "Permission denied"
- Make scripts executable: `chmod +x vertex-cli bin/*`

### "jq: command not found"
- Install jq: `brew install jq` (macOS) or `sudo apt-get install jq` (Linux)

## Need More Help?

- Check [INSTALL.md](docs/INSTALL.md) for detailed setup
- Open an issue: https://github.com/code-wiki/vertex-cli/issues
