#!/bin/bash

# Cross-platform installation script for Vertex CLI
# Supports: macOS, Linux (Ubuntu/Debian/CentOS/RHEL), Windows (Git Bash/WSL)

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════╗
║      Vertex CLI - Installation       ║
║        Cross-Platform Setup          ║
╚═══════════════════════════════════════╝
EOF
echo -e "${NC}"

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            OS=$ID
            OS_VERSION=$VERSION_ID
        else
            OS="linux"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
        OS="windows"
    else
        OS="unknown"
    fi
    
    echo -e "${BLUE}Detected OS: $OS${NC}\n"
}

# Check if command exists
check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is not installed"
        return 1
    fi
}

# Install dependencies based on OS
install_dependencies() {
    echo -e "${BLUE}Installing dependencies...${NC}\n"
    
    case $OS in
        ubuntu|debian)
            echo "Using apt package manager..."
            sudo apt-get update
            sudo apt-get install -y curl jq
            
            # Install gcloud SDK
            if ! command -v gcloud &> /dev/null; then
                echo "Installing Google Cloud SDK..."
                echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
                curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
                sudo apt-get update && sudo apt-get install -y google-cloud-sdk
            fi
            ;;
            
        centos|rhel|fedora)
            echo "Using yum/dnf package manager..."
            sudo yum install -y curl jq
            
            # Install gcloud SDK
            if ! command -v gcloud &> /dev/null; then
                echo "Installing Google Cloud SDK..."
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
            fi
            ;;
            
        macos)
            if ! command -v brew &> /dev/null; then
                echo -e "${RED}Homebrew not found${NC}"
                echo "Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            
            echo "Using Homebrew..."
            brew install jq google-cloud-sdk
            ;;
            
        windows)
            echo -e "${YELLOW}Windows detected${NC}"
            echo ""
            echo "Please install the following manually:"
            echo ""
            echo "1. Git Bash (if not already installed):"
            echo "   https://git-scm.com/download/win"
            echo ""
            echo "2. Google Cloud SDK:"
            echo "   https://cloud.google.com/sdk/docs/install#windows"
            echo ""
            echo "3. jq (JSON processor):"
            echo "   Download from: https://stedolan.github.io/jq/download/"
            echo "   Place jq.exe in C:\\Windows\\System32 or add to PATH"
            echo ""
            echo "Alternative: Use WSL (Windows Subsystem for Linux)"
            echo "   wsl --install"
            echo ""
            read -p "Press Enter after installing dependencies..."
            ;;
            
        *)
            echo -e "${RED}Unsupported OS: $OS${NC}"
            echo ""
            echo "Please install manually:"
            echo "  - curl"
            echo "  - jq"
            echo "  - gcloud CLI"
            exit 1
            ;;
    esac
}

# Main installation
main() {
    detect_os
    
    echo -e "${BLUE}Checking dependencies...${NC}\n"
    
    MISSING_DEPS=()
    
    check_command "bash" || MISSING_DEPS+=("bash")
    check_command "curl" || MISSING_DEPS+=("curl")
    check_command "jq" || MISSING_DEPS+=("jq")
    check_command "gcloud" || MISSING_DEPS+=("gcloud")
    
    echo ""
    
    if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
        echo -e "${YELLOW}Missing dependencies: ${MISSING_DEPS[*]}${NC}"
        echo ""
        read -p "Install missing dependencies? (y/n): " install_choice
        
        if [ "$install_choice" = "y" ]; then
            install_dependencies
        else
            echo -e "${YELLOW}Please install dependencies manually${NC}"
            exit 1
        fi
    else
        echo -e "${GREEN}All dependencies installed!${NC}"
    fi
    
    # Make scripts executable
    echo ""
    echo -e "${BLUE}Setting up scripts...${NC}"
    chmod +x vertex-cli bin/* 2>/dev/null || true
    echo -e "${GREEN}✓ Scripts configured${NC}"
    
    # Create config directory
    mkdir -p "$HOME/.vertex-cli" 2>/dev/null || true
    
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║     Installation Complete!           ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
    echo ""
    echo "Next steps:"
    echo ""
    echo "1. Run Vertex CLI:"
    echo -e "   ${BLUE}./vertex-cli${NC}"
    echo ""
    echo "2. Or install globally:"
    echo -e "   ${BLUE}sudo make install${NC}"
    echo "   Then use: ${BLUE}vertex-cli${NC} from anywhere"
    echo ""
}

main
