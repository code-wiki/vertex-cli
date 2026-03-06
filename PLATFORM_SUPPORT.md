# Platform Support Guide

## Supported Platforms

Vertex CLI supports all major operating systems:

- ✅ **Linux** (Ubuntu, Debian, CentOS, RHEL, Fedora)
- ✅ **macOS** (Intel & Apple Silicon)
- ✅ **Windows** (Git Bash, WSL, PowerShell, CMD)

---

## Linux

### Ubuntu / Debian

```bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y git curl jq

# Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk

# Clone and run
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./install.sh
./vertex-cli
```

### CentOS / RHEL / Fedora

```bash
# Install dependencies
sudo yum install -y git curl jq

# Install Google Cloud SDK
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
sudo yum install -y google-cloud-sdk

# Clone and run
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./install.sh
./vertex-cli
```

---

## macOS

### Intel & Apple Silicon (M1/M2/M3)

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install git jq google-cloud-sdk

# Clone and run
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./install.sh
./vertex-cli
```

---

## Windows

### Option 1: Git Bash (Recommended)

**Install Git Bash:**
1. Download from: https://git-scm.com/download/win
2. Run installer with default options

**Install Google Cloud SDK:**
1. Download from: https://cloud.google.com/sdk/docs/install#windows
2. Run installer
3. Restart Git Bash

**Install jq:**
```bash
# In Git Bash
curl -L -o /usr/bin/jq.exe https://github.com/stedolan/jq/releases/latest/download/jq-win64.exe
```

**Run Vertex CLI:**
```bash
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
bash install.sh
bash vertex-cli
```

### Option 2: WSL (Windows Subsystem for Linux)

**Install WSL:**
```powershell
# In PowerShell as Administrator
wsl --install
```

**After restart, in WSL:**
```bash
# Update packages
sudo apt-get update
sudo apt-get install -y git curl jq

# Install gcloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Clone and run
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
./install.sh
./vertex-cli
```

### Option 3: PowerShell

**Prerequisites:**
- Git for Windows
- Google Cloud SDK
- jq (download from https://stedolan.github.io/jq/download/)

**Run:**
```powershell
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
.\vertex-cli.ps1
```

### Option 4: Command Prompt

**Prerequisites:**
- Git for Windows
- Google Cloud SDK
- jq

**Run:**
```cmd
git clone https://github.com/code-wiki/vertex-cli.git
cd vertex-cli
vertex-cli.bat
```

---

## Platform-Specific Notes

### Linux
- Requires sudo access for package installation
- Works on all major distributions
- Tested on Ubuntu 20.04+, Debian 10+, CentOS 7+

### macOS
- Works on both Intel and Apple Silicon
- Requires Homebrew for easy installation
- Tested on macOS 11+ (Big Sur and later)

### Windows
- **Git Bash** is the recommended method
- **WSL** provides the best Linux compatibility
- PowerShell and CMD require manual dependency installation
- Tested on Windows 10 and Windows 11

---

## Troubleshooting by Platform

### Linux Issues

**Permission denied:**
```bash
chmod +x vertex-cli bin/*
```

**gcloud not found after install:**
```bash
exec -l $SHELL
# OR
source ~/.bashrc
```

### macOS Issues

**Homebrew not found:**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Permission issues:**
```bash
sudo chown -R $(whoami) /usr/local/bin
```

### Windows Issues

**Bash not found:**
- Install Git Bash from https://git-scm.com/download/win
- Or use WSL: `wsl --install`

**gcloud not recognized:**
- Restart terminal after installation
- Add to PATH: `C:\Program Files (x86)\Google\Cloud SDK\google-cloud-sdk\bin`

**jq not found:**
- Download from https://stedolan.github.io/jq/download/
- Place in `C:\Windows\System32` or add to PATH

---

## Verification

After installation, verify everything works:

```bash
# Check dependencies
bash --version
curl --version
jq --version
gcloud --version

# Run Vertex CLI
./vertex-cli
```

---

## Getting Help

If you encounter platform-specific issues:

1. Check [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. Open an issue: https://github.com/code-wiki/vertex-cli/issues
3. Include:
   - Operating system and version
   - Error messages
   - Output of dependency checks
