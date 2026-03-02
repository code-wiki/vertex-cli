#!/bin/bash

# Setup script for Vertex CLI
# This script automates the initial setup process

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════╗
║      Vertex CLI - Setup              ║
║   Quick Setup & Dependency Check     ║
╚═══════════════════════════════════════╝
EOF
echo -e "${NC}"

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}Please do not run this script as root${NC}"
    exit 1
fi

# Function to check command availability
check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is not installed"
        return 1
    fi
}

# Function to detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            OS=$ID
        else
            OS="unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    else
        OS="unknown"
    fi
    echo -e "${BLUE}Detected OS: $OS${NC}\n"
}

# Check dependencies
echo -e "${BLUE}Checking dependencies...${NC}\n"

MISSING_DEPS=()

if ! check_command "bash"; then
    MISSING_DEPS+=("bash")
fi

if ! check_command "curl"; then
    MISSING_DEPS+=("curl")
fi

if ! check_command "jq"; then
    MISSING_DEPS+=("jq")
fi

echo ""

# Install missing dependencies
if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
    echo -e "${YELLOW}Missing dependencies: ${MISSING_DEPS[*]}${NC}"
    read -p "Would you like to install missing dependencies? (y/n): " install_deps

    if [ "$install_deps" = "y" ]; then
        detect_os

        case $OS in
            ubuntu|debian)
                echo "Installing with apt..."
                sudo apt-get update
                for dep in "${MISSING_DEPS[@]}"; do
                    sudo apt-get install -y "$dep"
                done
                ;;
            centos|rhel|fedora)
                echo "Installing with yum..."
                for dep in "${MISSING_DEPS[@]}"; do
                    sudo yum install -y "$dep"
                done
                ;;
            macos)
                if ! command -v brew &> /dev/null; then
                    echo -e "${RED}Homebrew not found. Please install from https://brew.sh${NC}"
                    exit 1
                fi
                echo "Installing with Homebrew..."
                for dep in "${MISSING_DEPS[@]}"; do
                    brew install "$dep"
                done
                ;;
            *)
                echo -e "${RED}Unsupported OS. Please install dependencies manually:${NC}"
                echo "${MISSING_DEPS[*]}"
                exit 1
                ;;
        esac
    else
        echo -e "${YELLOW}Please install missing dependencies manually${NC}"
        exit 1
    fi
fi

# Check gcloud (optional)
echo -e "\n${BLUE}Checking optional dependencies...${NC}\n"

if check_command "gcloud"; then
    PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
    if [ -n "$PROJECT_ID" ]; then
        echo -e "${GREEN}✓${NC} gcloud is configured (Project: $PROJECT_ID)"
    else
        echo -e "${YELLOW}⚠${NC} gcloud found but no project configured"
        echo "  Run: gcloud init"
    fi
else
    echo -e "${YELLOW}⚠${NC} gcloud CLI not found (required for Vertex AI)"
    echo "  Install from: https://cloud.google.com/sdk/docs/install"
fi

# Make scripts executable
echo -e "\n${BLUE}Setting up scripts...${NC}\n"

chmod +x enable-ai.sh
echo -e "${GREEN}✓${NC} Made enable-ai.sh executable"

chmod +x chat.sh
echo -e "${GREEN}✓${NC} Made chat.sh executable"

# Secure the config file location
CONFIG_FILE="$HOME/.ai-tools-config"
if [ -f "$CONFIG_FILE" ]; then
    chmod 600 "$CONFIG_FILE"
    echo -e "${GREEN}✓${NC} Secured existing config file permissions"
fi

# Summary
echo -e "\n${GREEN}═══════════════════════════════════════${NC}"
echo -e "${GREEN}Setup Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════${NC}\n"

echo "Next steps:"
echo "1. If using Vertex AI, ensure gcloud is configured:"
echo "   ${BLUE}gcloud auth login${NC}"
echo "   ${BLUE}gcloud auth application-default login${NC}"
echo ""
echo "2. Run the main script:"
echo "   ${BLUE}./enable-ai.sh${NC}"
echo ""
echo "3. Configure your preferred AI tool (Claude, Gemini, or OpenAI)"
echo ""
echo "4. Start chatting!"
echo ""
echo -e "For help, see: ${BLUE}README.md${NC} or ${BLUE}INSTALL.md${NC}"
echo ""
echo -e "${YELLOW}⭐ If you find this useful, please star the repository!${NC}"
