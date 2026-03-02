# Project Structure

Overview of the Vertex CLI project organization.

## Directory Tree

```
vertex-cli/
├── .github/
│   └── ISSUE_TEMPLATE/
│       ├── bug_report.md          # Bug report template
│       └── feature_request.md     # Feature request template
├── .gitignore                     # Git ignore rules
├── LICENSE                        # MIT License
├── README.md                      # Main documentation
├── QUICKSTART.md                  # Quick start guide
├── INSTALL.md                     # Detailed installation guide
├── EXAMPLES.md                    # Usage examples
├── CONTRIBUTING.md                # Contribution guidelines
├── SECURITY.md                    # Security policy and best practices
├── PROJECT_STRUCTURE.md           # This file
├── setup.sh                       # Automated setup script
├── enable-ai.sh                   # Main configuration script
└── chat.sh                        # AI chat interface
```

## File Descriptions

### Core Scripts

#### `enable-ai.sh`
Main interactive configuration script. Features:
- Interactive menu system
- Support for Claude, Gemini, and OpenAI configuration
- GCP environment detection
- Configuration testing
- Persistent settings management

#### `chat.sh`
AI chat interface. Features:
- Simple command-line chat interface
- Automatic AI provider detection
- Support for Claude, Gemini, and OpenAI
- Clean output formatting

#### `setup.sh`
Automated setup script. Features:
- Dependency checking (bash, curl, jq, gcloud)
- OS detection (macOS, Ubuntu, Debian, CentOS, RHEL)
- Automatic dependency installation
- Script permission setup
- Configuration file security

### Documentation

#### `README.md`
Main project documentation including:
- Project overview and features
- Prerequisites
- Installation instructions
- Basic usage
- Configuration examples
- Troubleshooting
- Links to detailed docs

#### `QUICKSTART.md`
Get started in 5 minutes:
- Super quick start commands
- Step-by-step first setup
- First conversation example
- Common issues and fixes

#### `INSTALL.md`
Comprehensive installation guide:
- Detailed prerequisites
- Platform-specific instructions
- GCP project setup
- Permission configuration
- Troubleshooting
- Uninstallation

#### `EXAMPLES.md`
Real-world usage examples:
- Basic chat examples
- Code generation examples
- Debugging help examples
- Script integration examples
- Multi-provider comparisons
- Advanced use cases

#### `CONTRIBUTING.md`
Guidelines for contributors:
- How to report bugs
- How to suggest features
- Pull request process
- Code style guidelines
- Testing requirements
- Adding new AI providers

#### `SECURITY.md`
Security policy and best practices:
- Security best practices for users
- Security guidelines for contributors
- Vulnerability reporting process
- Known limitations
- Production recommendations

#### `PROJECT_STRUCTURE.md`
This file - project organization reference.

### Configuration

#### `.gitignore`
Prevents committing:
- Configuration files with API keys
- Credentials
- Temporary files
- IDE files
- System files

#### `.ai-tools-config` (generated)
User configuration file (not in repo):
```bash
AI_TOOL=claude
PROJECT_ID=my-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
ENDPOINT=https://us-central1-aiplatform.googleapis.com
```

### GitHub Templates

#### `.github/ISSUE_TEMPLATE/bug_report.md`
Bug report template for consistent issue reporting.

#### `.github/ISSUE_TEMPLATE/feature_request.md`
Feature request template for new feature suggestions.

## Code Flow

### Configuration Flow (`enable-ai.sh`)

```
┌─────────────────────────────────────┐
│     Start enable-ai.sh              │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Check GCP Environment              │
│  - Detect if on GCP VM              │
│  - Check gcloud installation        │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Display Main Menu                  │
│  1. Configure Claude                │
│  2. Configure Gemini                │
│  3. Configure OpenAI                │
│  4. Show config                     │
│  5. Test config                     │
│  6. Launch chat                     │
│  7. Exit                            │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  User Selection                     │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Configure Selected AI Tool         │
│  - Prompt for settings              │
│  - Validate inputs                  │
│  - Save to ~/.ai-tools-config       │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Return to Menu or Exit             │
└─────────────────────────────────────┘
```

### Chat Flow (`chat.sh`)

```
┌─────────────────────────────────────┐
│     Start chat.sh                   │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Load Configuration                 │
│  - Read ~/.ai-tools-config          │
│  - Check if config exists           │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Display Chat Interface             │
│  - Show AI tool and model           │
│  - Instructions                     │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Chat Loop                          │
│  ┌───────────────────────────────┐  │
│  │ 1. Read user input            │  │
│  │ 2. Check for exit command     │  │
│  │ 3. Call AI API                │  │
│  │ 4. Display response           │  │
│  │ 5. Repeat                     │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

### Setup Flow (`setup.sh`)

```
┌─────────────────────────────────────┐
│     Start setup.sh                  │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Detect OS                          │
│  - macOS, Ubuntu, Debian, etc.      │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Check Dependencies                 │
│  - bash, curl, jq                   │
│  - gcloud (optional)                │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Install Missing Dependencies       │
│  - Prompt user                      │
│  - Use OS package manager           │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Set Up Scripts                     │
│  - chmod +x *.sh                    │
│  - Secure config file               │
└──────────┬──────────────────────────┘
           │
           ▼
┌─────────────────────────────────────┐
│  Display Next Steps                 │
└─────────────────────────────────────┘
```

## Configuration File Format

The `~/.ai-tools-config` file uses simple shell variable format:

### For Claude/Gemini (Vertex AI)
```bash
AI_TOOL=claude  # or gemini
PROJECT_ID=my-gcp-project
REGION=us-central1
MODEL=claude-3-5-sonnet@20240620
ENDPOINT=https://us-central1-aiplatform.googleapis.com
```

### For OpenAI
```bash
AI_TOOL=openai
OPENAI_API_KEY=sk-...
MODEL=gpt-4o
ENDPOINT=https://api.openai.com/v1
```

## Dependencies

### Required
- **bash** (4.0+): Shell scripting
- **curl**: HTTP requests to AI APIs
- **jq**: JSON parsing and formatting

### Optional
- **gcloud CLI**: Required for GCP Vertex AI (Claude, Gemini)
- **git**: For cloning repository

## Security Considerations

### Sensitive Files
All sensitive files are in `.gitignore`:
- `.ai-tools-config` - Contains API keys
- `*.key` - Key files
- `.env*` - Environment files
- `credentials.json` - GCP credentials

### File Permissions
The setup script sets:
- Config file: `chmod 600` (read/write owner only)
- Scripts: `chmod +x` (executable)

## Extension Points

### Adding New AI Providers

To add a new AI provider, modify:

1. **enable-ai.sh**:
   - Add `configure_newai()` function
   - Add menu option
   - Add to help text

2. **chat.sh**:
   - Add `call_newai()` function
   - Add to case statement

3. **Documentation**:
   - Update README.md
   - Update EXAMPLES.md
   - Update this file

### Adding New Features

Consider modifying:
- `enable-ai.sh` for configuration features
- `chat.sh` for chat features
- `setup.sh` for setup automation
- Documentation files

## Testing

Before committing changes, test:

1. **Fresh installation**
   ```bash
   ./setup.sh
   ```

2. **Configuration**
   ```bash
   ./enable-ai.sh
   # Test each provider
   ```

3. **Chat functionality**
   ```bash
   ./chat.sh
   # Test basic conversation
   ```

4. **Different environments**
   - Local machine
   - GCP VM (if possible)
   - Different OS (macOS, Linux)

## Future Enhancements

Potential additions:
- Web interface
- Docker support
- Conversation history
- Multi-turn context
- Streaming responses
- Cost tracking
- Custom prompts
- File upload support

---

For questions about project structure, see [CONTRIBUTING.md](CONTRIBUTING.md) or open an issue.
