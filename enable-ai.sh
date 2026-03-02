#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

CONFIG_FILE="$HOME/.ai-tools-config"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   AI Tools Configuration${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Function to check if running on GCP
check_gcp_environment() {
    if curl -s -f -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/id &> /dev/null; then
        echo -e "${GREEN}✓ Running on GCP VM${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠ Running on local machine${NC}"
        return 1
    fi
}

# Function to check gcloud CLI
check_gcloud() {
    if command -v gcloud &> /dev/null; then
        PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
        if [ -n "$PROJECT_ID" ]; then
            echo -e "${GREEN}✓ gcloud CLI configured (Project: $PROJECT_ID)${NC}"
            return 0
        else
            echo -e "${YELLOW}⚠ gcloud CLI found but no project set${NC}"
            return 1
        fi
    else
        echo -e "${RED}✗ gcloud CLI not found${NC}"
        return 1
    fi
}

# Function to save configuration
save_config() {
    local ai_tool=$1
    local config_data=$2
    echo "AI_TOOL=$ai_tool" > "$CONFIG_FILE"
    echo "$config_data" >> "$CONFIG_FILE"
    echo -e "${GREEN}✓ Configuration saved to $CONFIG_FILE${NC}"
}

# Function to load configuration
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
        return 0
    else
        return 1
    fi
}

# Function to configure Claude (Vertex AI)
configure_claude() {
    echo -e "${BLUE}\n--- Configuring Claude via Vertex AI ---${NC}"

    if ! check_gcloud; then
        echo -e "${RED}Please install and configure gcloud CLI first${NC}"
        echo "Visit: https://cloud.google.com/sdk/docs/install"
        return 1
    fi

    read -p "Enter GCP Project ID (or press Enter to use current): " PROJECT_ID
    if [ -z "$PROJECT_ID" ]; then
        PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
    fi

    read -p "Enter GCP Region (default: us-central1): " REGION
    REGION=${REGION:-us-central1}

    read -p "Enter Claude Model (default: claude-3-5-sonnet@20240620): " MODEL
    MODEL=${MODEL:-claude-3-5-sonnet@20240620}

    save_config "claude" "PROJECT_ID=$PROJECT_ID
REGION=$REGION
MODEL=$MODEL
ENDPOINT=https://$REGION-aiplatform.googleapis.com"

    echo -e "${GREEN}\n✓ Claude configured successfully!${NC}"
    echo -e "Project: $PROJECT_ID"
    echo -e "Region: $REGION"
    echo -e "Model: $MODEL"
}

# Function to configure Gemini (Vertex AI)
configure_gemini() {
    echo -e "${BLUE}\n--- Configuring Gemini via Vertex AI ---${NC}"

    if ! check_gcloud; then
        echo -e "${RED}Please install and configure gcloud CLI first${NC}"
        echo "Visit: https://cloud.google.com/sdk/docs/install"
        return 1
    fi

    read -p "Enter GCP Project ID (or press Enter to use current): " PROJECT_ID
    if [ -z "$PROJECT_ID" ]; then
        PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
    fi

    read -p "Enter GCP Region (default: us-central1): " REGION
    REGION=${REGION:-us-central1}

    read -p "Enter Gemini Model (default: gemini-2.0-flash-exp): " MODEL
    MODEL=${MODEL:-gemini-2.0-flash-exp}

    save_config "gemini" "PROJECT_ID=$PROJECT_ID
REGION=$REGION
MODEL=$MODEL
ENDPOINT=https://$REGION-aiplatform.googleapis.com"

    echo -e "${GREEN}\n✓ Gemini configured successfully!${NC}"
    echo -e "Project: $PROJECT_ID"
    echo -e "Region: $REGION"
    echo -e "Model: $MODEL"
}

# Function to configure OpenAI
configure_openai() {
    echo -e "${BLUE}\n--- Configuring OpenAI ---${NC}"

    read -sp "Enter your OpenAI API Key: " OPENAI_API_KEY
    echo ""

    read -p "Enter OpenAI Model (default: gpt-4o): " MODEL
    MODEL=${MODEL:-gpt-4o}

    read -p "Enter API Endpoint (default: https://api.openai.com/v1): " ENDPOINT
    ENDPOINT=${ENDPOINT:-https://api.openai.com/v1}

    save_config "openai" "OPENAI_API_KEY=$OPENAI_API_KEY
MODEL=$MODEL
ENDPOINT=$ENDPOINT"

    echo -e "${GREEN}\n✓ OpenAI configured successfully!${NC}"
    echo -e "Model: $MODEL"
}

# Function to test configuration
test_configuration() {
    if ! load_config; then
        echo -e "${RED}No configuration found. Please configure an AI tool first.${NC}"
        return 1
    fi

    echo -e "${BLUE}\n--- Testing $AI_TOOL Configuration ---${NC}"

    case $AI_TOOL in
        claude|gemini)
            echo "Testing Vertex AI connection..."
            gcloud auth application-default print-access-token &> /dev/null
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}✓ Authentication successful${NC}"
            else
                echo -e "${RED}✗ Authentication failed. Run: gcloud auth application-default login${NC}"
                return 1
            fi
            ;;
        openai)
            echo "Testing OpenAI API..."
            curl -s -H "Authorization: Bearer $OPENAI_API_KEY" \
                 -H "Content-Type: application/json" \
                 https://api.openai.com/v1/models &> /dev/null
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}✓ API key is valid${NC}"
            else
                echo -e "${RED}✗ API key validation failed${NC}"
                return 1
            fi
            ;;
    esac
}

# Function to display current configuration
show_config() {
    if load_config; then
        echo -e "${BLUE}\n--- Current Configuration ---${NC}"
        echo -e "AI Tool: ${GREEN}$AI_TOOL${NC}"
        case $AI_TOOL in
            claude|gemini)
                echo -e "Project: $PROJECT_ID"
                echo -e "Region: $REGION"
                echo -e "Model: $MODEL"
                ;;
            openai)
                echo -e "Model: $MODEL"
                echo -e "API Key: ${OPENAI_API_KEY:0:10}...${OPENAI_API_KEY: -4}"
                ;;
        esac
    else
        echo -e "${YELLOW}No configuration found${NC}"
    fi
}

# Main menu
while true; do
    echo -e "\n${BLUE}--- Main Menu ---${NC}"
    echo "1) Configure Claude (Vertex AI)"
    echo "2) Configure Gemini (Vertex AI)"
    echo "3) Configure OpenAI"
    echo "4) Show current configuration"
    echo "5) Test configuration"
    echo "6) Launch AI chat interface"
    echo "7) Exit"
    echo ""

    check_gcp_environment
    echo ""

    read -p "Select an option (1-7): " choice

    case $choice in
        1)
            configure_claude
            ;;
        2)
            configure_gemini
            ;;
        3)
            configure_openai
            ;;
        4)
            show_config
            ;;
        5)
            test_configuration
            ;;
        6)
            if load_config; then
                echo -e "${GREEN}Launching AI chat interface...${NC}"
                ./chat.sh
            else
                echo -e "${RED}Please configure an AI tool first${NC}"
            fi
            ;;
        7)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
done
