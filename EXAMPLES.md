# Usage Examples

Real-world examples of using GCP AI Tools Runner.

## Table of Contents
- [Basic Chat](#basic-chat)
- [Code Generation](#code-generation)
- [Debugging Help](#debugging-help)
- [Script Usage](#script-usage)
- [Multi-Provider Comparison](#multi-provider-comparison)

## Basic Chat

### Starting a Conversation

```bash
$ ./enable-ai.sh
================================
   AI Tools Configuration
================================

⚠ Running on local machine

--- Main Menu ---
1) Configure Claude (Vertex AI)
2) Configure Gemini (Vertex AI)
3) Configure OpenAI
4) Show current configuration
5) Test configuration
6) Launch AI chat interface
7) Exit

Select an option (1-7): 1

--- Configuring Claude via Vertex AI ---
✓ gcloud CLI configured (Project: my-ai-project)
Enter GCP Project ID (or press Enter to use current): [Press Enter]
Enter GCP Region (default: us-central1): [Press Enter]
Enter Claude Model (default: claude-3-5-sonnet@20240620): [Press Enter]

✓ Claude configured successfully!
Project: my-ai-project
Region: us-central1
Model: claude-3-5-sonnet@20240620
```

### Using the Chat Interface

```bash
$ ./chat.sh
================================
   AI Chat Interface (claude)
================================

Chat started. Type 'exit' or 'quit' to end the session.
Using: claude (claude-3-5-sonnet@20240620)

You: Hello! Can you help me with Python?
AI: Hello! I'd be happy to help you with Python. What specific topic or problem would you like assistance with?

You: exit
Goodbye!
```

## Code Generation

### Example 1: Generate a Python Function

```bash
You: Write a Python function to validate email addresses using regex

AI: Here's a Python function to validate email addresses:

```python
import re

def validate_email(email):
    """
    Validate an email address using regex.

    Args:
        email (str): Email address to validate

    Returns:
        bool: True if valid, False otherwise
    """
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None

# Examples
print(validate_email("user@example.com"))  # True
print(validate_email("invalid.email"))      # False
```

This function:
- Uses a regex pattern to match valid email formats
- Checks for username, @ symbol, domain, and TLD
- Returns boolean indicating validity
```

### Example 2: Generate a Bash Script

```bash
You: Create a bash script to backup a directory with timestamp

AI: Here's a bash script for timestamped directory backups:

```bash
#!/bin/bash

# Directory backup script with timestamp

SOURCE_DIR="$1"
BACKUP_DIR="${2:-./backups}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_${TIMESTAMP}.tar.gz"

# Validate source directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory does not exist"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
echo "Backing up $SOURCE_DIR..."
tar -czf "${BACKUP_DIR}/${BACKUP_NAME}" "$SOURCE_DIR"

echo "Backup completed: ${BACKUP_DIR}/${BACKUP_NAME}"
```

Usage: `./backup.sh /path/to/source /path/to/backups`
```

## Debugging Help

### Example: Debug Python Error

```bash
You: I'm getting "TypeError: 'int' object is not iterable" in my Python code. Here's the code:

for i in 5:
    print(i)

AI: The error occurs because you're trying to iterate over an integer (5) directly.
In Python, you can only iterate over iterable objects like lists, tuples, or ranges.

Fix:
```python
# Use range() to create an iterable
for i in range(5):
    print(i)
```

This will print: 0, 1, 2, 3, 4

If you want to print just the number 5, you don't need a loop:
```python
print(5)
```
```

## Script Usage

### Using AI Tools in Your Own Scripts

Create a custom script that uses the configured AI:

```bash
#!/bin/bash
# my-ai-helper.sh

# Load configuration
source ~/.ai-tools-config

ask_ai() {
    local question="$1"
    local access_token=$(gcloud auth application-default print-access-token)

    local request_body=$(cat <<EOF
{
  "anthropic_version": "vertex-2023-10-16",
  "messages": [{"role": "user", "content": "$question"}],
  "max_tokens": 1024
}
EOF
)

    curl -s -X POST \
        -H "Authorization: Bearer $access_token" \
        -H "Content-Type: application/json" \
        "$ENDPOINT/v1/projects/$PROJECT_ID/locations/$REGION/publishers/anthropic/models/$MODEL:streamRawPredict" \
        -d "$request_body" | jq -r '.content[0].text'
}

# Use it
ask_ai "What's the capital of France?"
```

### Automated Code Review

```bash
#!/bin/bash
# code-review.sh

source ~/.ai-tools-config

FILE="$1"
CODE=$(cat "$FILE")

ask_ai "Review this code for potential issues and suggest improvements:\n\n$CODE"
```

Usage:
```bash
./code-review.sh myfile.py
```

## Multi-Provider Comparison

### Compare Responses from Different Models

```bash
# Configure all three providers first
$ ./enable-ai.sh
# Set up Claude, Gemini, and OpenAI

# Create comparison script
#!/bin/bash

QUESTION="Explain the difference between TCP and UDP in simple terms"

echo "=== Claude ==="
# Switch config to Claude
sed -i '' 's/AI_TOOL=.*/AI_TOOL=claude/' ~/.ai-tools-config
./chat.sh <<< "$QUESTION"

echo -e "\n=== Gemini ==="
# Switch config to Gemini
sed -i '' 's/AI_TOOL=.*/AI_TOOL=gemini/' ~/.ai-tools-config
./chat.sh <<< "$QUESTION"

echo -e "\n=== OpenAI ==="
# Switch config to OpenAI
sed -i '' 's/AI_TOOL=.*/AI_TOOL=openai/' ~/.ai-tools-config
./chat.sh <<< "$QUESTION"
```

## Advanced Examples

### Example 1: Code Explanation Pipeline

```bash
#!/bin/bash
# explain-code.sh

source ~/.ai-tools-config

# Find all Python files and get explanations
find . -name "*.py" -type f | while read file; do
    echo "Analyzing: $file"
    code=$(cat "$file")
    explanation=$(ask_ai "Briefly explain what this code does:\n\n$code")
    echo "$file: $explanation" >> code-explanations.txt
done
```

### Example 2: Commit Message Generator

```bash
#!/bin/bash
# generate-commit-msg.sh

source ~/.ai-tools-config

# Get git diff
DIFF=$(git diff --cached)

if [ -z "$DIFF" ]; then
    echo "No staged changes"
    exit 1
fi

# Ask AI to generate commit message
MSG=$(ask_ai "Generate a concise git commit message for these changes:\n\n$DIFF")

echo "Suggested commit message:"
echo "$MSG"
echo ""
read -p "Use this message? (y/n): " confirm

if [ "$confirm" = "y" ]; then
    git commit -m "$MSG"
fi
```

### Example 3: Interactive Code Refactoring

```bash
You: I have this function that's hard to read. Can you refactor it?

def p(d):
    r=[]
    for k in d:
        if d[k]>10:
            r.append(k)
    return r

AI: Here's a refactored version with better naming and readability:

```python
def filter_high_values(data_dict, threshold=10):
    """
    Filter dictionary keys where values exceed threshold.

    Args:
        data_dict (dict): Dictionary to filter
        threshold (int): Minimum value threshold

    Returns:
        list: Keys with values above threshold
    """
    return [key for key, value in data_dict.items() if value > threshold]
```

Improvements:
- Descriptive function and variable names
- Added docstring
- Used list comprehension for conciseness
- Added configurable threshold parameter
```

## Tips for Best Results

1. **Be Specific**: Provide context and details in your questions
2. **Iterate**: Ask follow-up questions to refine answers
3. **Provide Code**: Include relevant code snippets for debugging
4. **Use Examples**: Ask for examples when learning new concepts
5. **Test Output**: Always test generated code before using in production

## Cost-Saving Tips

1. **Use Free Credits**: Start with GCP free credits for Vertex AI
2. **Choose Right Model**: Use smaller models for simple tasks
3. **Optimize Prompts**: Be concise to reduce token usage
4. **Cache Responses**: Save common answers locally
5. **Monitor Usage**: Regularly check GCP billing dashboard

---

For more examples, visit the [GitHub repository](https://github.com/code-wiki/gcp-ai-tools-runner) or contribute your own!
