#!/bin/bash

set -e

CONFIG_FILE="$HOME/.ai-tools-config"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Load configuration
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}No configuration found. Please run ./enable-ai.sh first${NC}"
    exit 1
fi

source "$CONFIG_FILE"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   AI Chat Interface ($AI_TOOL)${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Function to call Claude via Vertex AI
call_claude() {
    local prompt="$1"
    local access_token=$(gcloud auth application-default print-access-token)

    local request_body=$(cat <<EOF
{
  "anthropic_version": "vertex-2023-10-16",
  "messages": [
    {
      "role": "user",
      "content": "$prompt"
    }
  ],
  "max_tokens": 4096
}
EOF
)

    curl -s -X POST \
        -H "Authorization: Bearer $access_token" \
        -H "Content-Type: application/json" \
        "$ENDPOINT/v1/projects/$PROJECT_ID/locations/$REGION/publishers/anthropic/models/$MODEL:streamRawPredict" \
        -d "$request_body" | jq -r '.content[0].text // .error.message // "Error: No response"'
}

# Function to call Gemini via Vertex AI
call_gemini() {
    local prompt="$1"
    local access_token=$(gcloud auth application-default print-access-token)

    local request_body=$(cat <<EOF
{
  "contents": [
    {
      "role": "user",
      "parts": [
        {
          "text": "$prompt"
        }
      ]
    }
  ],
  "generation_config": {
    "temperature": 0.7,
    "maxOutputTokens": 8192
  }
}
EOF
)

    curl -s -X POST \
        -H "Authorization: Bearer $access_token" \
        -H "Content-Type: application/json" \
        "$ENDPOINT/v1/projects/$PROJECT_ID/locations/$REGION/publishers/google/models/$MODEL:generateContent" \
        -d "$request_body" | jq -r '.candidates[0].content.parts[0].text // .error.message // "Error: No response"'
}

# Function to call OpenAI
call_openai() {
    local prompt="$1"

    local request_body=$(cat <<EOF
{
  "model": "$MODEL",
  "messages": [
    {
      "role": "user",
      "content": "$prompt"
    }
  ],
  "max_tokens": 4096
}
EOF
)

    curl -s -X POST \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -H "Content-Type: application/json" \
        "$ENDPOINT/chat/completions" \
        -d "$request_body" | jq -r '.choices[0].message.content // .error.message // "Error: No response"'
}

# Main chat loop
echo -e "${GREEN}Chat started. Type 'exit' or 'quit' to end the session.${NC}"
echo -e "${YELLOW}Using: $AI_TOOL ($MODEL)${NC}\n"

while true; do
    echo -ne "${BLUE}You: ${NC}"
    read -r user_input

    if [ -z "$user_input" ]; then
        continue
    fi

    if [ "$user_input" = "exit" ] || [ "$user_input" = "quit" ]; then
        echo -e "${GREEN}Goodbye!${NC}"
        exit 0
    fi

    echo -e "${GREEN}AI: ${NC}"

    case $AI_TOOL in
        claude)
            call_claude "$user_input"
            ;;
        gemini)
            call_gemini "$user_input"
            ;;
        openai)
            call_openai "$user_input"
            ;;
        *)
            echo -e "${RED}Unknown AI tool: $AI_TOOL${NC}"
            exit 1
            ;;
    esac

    echo -e "\n"
done
