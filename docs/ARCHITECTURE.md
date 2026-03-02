# Architecture

## Overview

Vertex CLI is a unified command-line interface that provides access to multiple AI providers through a consistent interface.

## Components

```
┌─────────────────────────────────────────────────────────┐
│                     Vertex CLI                          │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│  │ vertex-setup │  │ vertex-cli   │  │ vertex-chat  │ │
│  │              │  │              │  │              │ │
│  │ - Dep check  │  │ - Config UI  │  │ - Chat loop  │ │
│  │ - Install    │  │ - Provider   │  │ - API calls  │ │
│  │ - Init       │  │   select     │  │ - Response   │ │
│  └──────────────┘  └──────────────┘  └──────────────┘ │
│                                                         │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
              ┌──────────────────────┐
              │  ~/.ai-tools-config  │
              │                      │
              │  - AI_TOOL           │
              │  - PROJECT_ID        │
              │  - REGION            │
              │  - MODEL             │
              │  - ENDPOINT          │
              └──────────────────────┘
                          │
         ┌────────────────┼────────────────┐
         │                │                │
         ▼                ▼                ▼
   ┌─────────┐      ┌─────────┐      ┌─────────┐
   │ Claude  │      │ Gemini  │      │ OpenAI  │
   │ Vertex  │      │ Vertex  │      │  API    │
   │   AI    │      │   AI    │      │         │
   └─────────┘      └─────────┘      └─────────┘
```

## Scripts

### `bin/vertex-setup`

**Purpose:** Automated environment setup and dependency verification

**Responsibilities:**
- Detect operating system
- Check for required dependencies (bash, curl, jq, gcloud)
- Offer to install missing dependencies
- Set correct file permissions
- Guide user through initial configuration

### `bin/vertex-cli`

**Purpose:** Interactive configuration interface

**Responsibilities:**
- Display interactive menu
- Configure AI providers (Claude, Gemini, OpenAI)
- Save configuration to `~/.ai-tools-config`
- Test configuration validity
- Launch chat interface
- Detect GCP VM environment

**Flow:**
```
Start
  │
  ├─> Display Menu
  │     │
  │     ├─> Configure Claude
  │     │     │
  │     │     ├─> Check gcloud
  │     │     ├─> Prompt for config
  │     │     └─> Save to file
  │     │
  │     ├─> Configure Gemini
  │     │     │
  │     │     ├─> Check gcloud
  │     │     ├─> Prompt for config
  │     │     └─> Save to file
  │     │
  │     ├─> Configure OpenAI
  │     │     │
  │     │     ├─> Prompt for API key
  │     │     └─> Save to file
  │     │
  │     ├─> Show Configuration
  │     ├─> Test Configuration
  │     ├─> Launch Chat
  │     └─> Exit
  │
  └─> Loop until exit
```

### `bin/vertex-chat`

**Purpose:** Interactive chat interface with AI models

**Responsibilities:**
- Load configuration from `~/.ai-tools-config`
- Validate configuration exists
- Implement chat loop (read input, call API, display response)
- Handle API calls for each provider:
  - Claude via Vertex AI
  - Gemini via Vertex AI
  - OpenAI via direct API
- Format and display responses
- Handle exit conditions

**API Call Flow:**
```
User Input
  │
  ├─> Validate not empty
  ├─> Check for exit command
  │
  └─> Route to provider
        │
        ├─> Claude
        │     │
        │     ├─> Get access token (gcloud)
        │     ├─> Build request payload
        │     ├─> POST to Vertex AI endpoint
        │     └─> Parse response
        │
        ├─> Gemini
        │     │
        │     ├─> Get access token (gcloud)
        │     ├─> Build request payload
        │     ├─> POST to Vertex AI endpoint
        │     └─> Parse response
        │
        └─> OpenAI
              │
              ├─> Use API key
              ├─> Build request payload
              ├─> POST to OpenAI endpoint
              └─> Parse response
```

## Configuration File

**Location:** `~/.ai-tools-config`

**Format:** Shell variables (sourceable)

**Fields:**
- `AI_TOOL`: Selected provider (claude, gemini, openai)
- `PROJECT_ID`: GCP project ID (Vertex AI only)
- `REGION`: GCP region (Vertex AI only)
- `MODEL`: Model identifier
- `ENDPOINT`: API endpoint URL
- `OPENAI_API_KEY`: OpenAI API key (OpenAI only)

**Security:**
- File permissions: 600 (read/write owner only)
- Contains sensitive data (API keys)
- Not version controlled (.gitignore)

## Authentication

### Vertex AI (Claude & Gemini)

Uses Google Cloud authentication:
1. User authenticates with `gcloud auth login`
2. Application default credentials set via `gcloud auth application-default login`
3. Access tokens retrieved per-request via `gcloud auth application-default print-access-token`
4. Tokens passed as Bearer authorization header

### OpenAI

Uses API key authentication:
1. User provides API key during configuration
2. Key stored in `~/.ai-tools-config`
3. Key passed as Bearer authorization header with each request

## Error Handling

**Strategy:** Fail gracefully with helpful error messages

**Implementation:**
- Use `set -e` for early exit on errors
- Add `|| true` for expected failures (environment checks)
- Validate prerequisites before operations
- Provide actionable error messages with fix instructions
- Test configuration before use

## Security Considerations

1. **Credential Storage:**
   - Config file has restricted permissions (600)
   - API keys never logged or displayed in full
   - No credentials in version control

2. **API Communication:**
   - All API calls use HTTPS
   - Tokens/keys passed via headers (not URL)
   - No sensitive data in error messages

3. **Input Validation:**
   - User input escaped before use
   - Commands use proper quoting
   - JSON payloads properly escaped

## Future Enhancements

- [ ] Conversation history persistence
- [ ] Multi-turn context management
- [ ] Streaming response support
- [ ] Cost tracking and budgets
- [ ] Custom system prompts
- [ ] Plugin architecture for new providers
- [ ] TUI (text user interface) with rich formatting
- [ ] Session management
- [ ] Export conversations to markdown
