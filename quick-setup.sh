#!/bin/bash

# Quick setup script for Vertex CLI
# This automates the entire setup process

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════╗
║      Vertex CLI - Quick Setup        ║
╚═══════════════════════════════════════╝
EOF
echo -e "${NC}"

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo -e "${RED}✗ gcloud CLI not found${NC}"
    echo ""
    echo "Please install gcloud CLI first:"
    echo ""
    echo "macOS:"
    echo "  brew install google-cloud-sdk"
    echo ""
    echo "Linux:"
    echo "  curl https://sdk.cloud.google.com | bash"
    echo ""
    exit 1
fi

echo -e "${GREEN}✓ gcloud CLI found${NC}"

# Check if authenticated
if ! gcloud auth application-default print-access-token &> /dev/null; then
    echo -e "${YELLOW}⚠ Not authenticated${NC}"
    echo ""
    echo "Opening browser for authentication..."
    echo ""
    
    if ! gcloud auth application-default login; then
        echo -e "${RED}✗ Authentication failed${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}✓ Authenticated${NC}"

# Get or set project
PROJECT_ID=$(gcloud config get-value project 2>/dev/null)

if [ -z "$PROJECT_ID" ]; then
    echo ""
    read -p "Enter your GCP Project ID: " PROJECT_ID
    gcloud config set project "$PROJECT_ID"
fi

echo -e "${GREEN}✓ Project set: $PROJECT_ID${NC}"

# Enable API
echo ""
echo "Enabling Vertex AI API..."
if gcloud services enable aiplatform.googleapis.com --project="$PROJECT_ID" 2>/dev/null; then
    echo -e "${GREEN}✓ API enabled${NC}"
else
    echo -e "${YELLOW}⚠ API might already be enabled${NC}"
fi

# Make scripts executable
chmod +x vertex-cli bin/* 2>/dev/null || true

echo ""
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo -e "${GREEN}Setup Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo ""
echo "Next steps:"
echo ""
echo "1. Configure your AI provider:"
echo -e "   ${BLUE}./vertex-cli${NC}"
echo ""
echo "2. Start chatting:"
echo -e "   ${BLUE}./bin/vertex-chat${NC}"
echo ""
