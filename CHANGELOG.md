# Changelog

## [Unreleased] - 2026-03-06

### Added - Enhanced Chat Interface UX 🎨

#### New Features
- **Animated Spinner**: Beautiful loading animation while AI processes requests
  - 10-frame Unicode Braille spinner (⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏)
  - Status message: "Processing your request"
  - Eliminates confusion during long pauses
  
- **Modern UI Design**:
  - Box-style prompts with `┌─[You]` and `└─▶` format
  - Separator lines for visual clarity
  - Emoji integration (✨, ⚡, 👋, ✓)
  - Color-coded sections
  
- **Typing Effect**: Character-by-character animation on exit message
  - "✨ Thank you for using Vertex CLI! Goodbye! 👋"
  - 50 characters per second
  - Professional polish
  
- **Enhanced Authentication Display**:
  - Framed display with separator lines
  - Clear, prominent account information
  - Professional presentation
  
- **Syntax Highlighting**:
  - Code blocks in dim cyan
  - Headings in bold white
  - Bullet points in cyan
  - Automatic detection and formatting
  
- **Improved Visual Hierarchy**:
  - Clear distinction between user and AI
  - Session info display
  - Command help in header
  - Separator lines between exchanges

#### Benefits
- **No More Confusion**: Always know when AI is processing
- **Professional Look**: Modern CLI design inspired by Claude/Gemini CLIs
- **Better UX**: Smooth animations and clear feedback
- **Visual Polish**: Beautiful interface that's a pleasure to use

### Added - CLI Tools Installation & Management 🔧

#### New Features
- **CLI Installation Manager**: Install and manage official Claude and Gemini CLIs
  - Install Claude CLI (@anthropic-ai/claude-code)
  - Install Gemini CLI (@google/gemini-cli)
  - Update, reinstall, or uninstall CLIs
  - Automatic prerequisite checking (Node.js, npm)
  
- **Menu Integration**:
  - Option 7: Install/Manage Claude CLI
  - Option 8: Install/Manage Gemini CLI
  - Interactive management interface
  - Version detection and display

#### Benefits
- **One-Stop Shop**: Install official CLIs without leaving Vertex CLI
- **Easy Management**: Update, reinstall, or remove CLIs with one click
- **Prerequisites Check**: Automatically verifies Node.js and npm
- **User-Friendly**: Clear prompts and status messages

### Added - All Claude Models Support 🎉

#### New Features
- **14 Claude Models**: Complete coverage from Claude 3 to Claude 4.6
  - Claude 4.x Series (8 models): Latest generation models
  - Claude 3.x Series (6 models): Including deprecated legacy models
  
- **Interactive Model Selection**: 
  - Numbered menu (1-14) for easy selection
  - Direct model name input support
  - Clear categorization (4.x vs 3.x)
  - Descriptive labels for each model

- **Comprehensive Documentation**:
  - New `docs/CLAUDE_MODELS.md` with complete model guide
  - Regional availability for each model
  - Use case recommendations
  - Troubleshooting guide

#### Modified Files

##### `bin/vertex-cli`
- Expanded Claude model list from 8 to 14 models
- Added interactive numbered menu (1-14)
- Added support for direct model name input
- Updated model descriptions with official names
- Added Claude 4.x series categorization

##### `bin/vertex-chat`
- Fixed API endpoint: `streamRawPredict` → `rawPredict`
- Fixed response parsing: `.content[0].text` → `.content[]?.text`
- Now compatible with all Claude models

##### `README.md`
- Updated Claude model count (4 → 14 models)
- Added link to comprehensive model documentation
- Updated model examples to latest versions

##### `docs/CLAUDE_MODELS.md` (NEW)
- Complete guide to all 14 Claude models
- Detailed descriptions and use cases
- Regional availability matrix
- Configuration examples
- Troubleshooting section

#### Technical Changes

**API Updates:**
- Changed from `streamRawPredict` to `rawPredict` for non-streaming
- Updated model naming format: removed `@latest` suffixes, use hyphens
- Fixed JSON response parsing for Claude API

**Model Naming Convention:**
- Old: `claude-3-5-sonnet@20240620`
- New: `claude-3-5-sonnet` or `claude-sonnet-4-6`

**Supported Models:**

Claude 4.x Series:
1. `claude-sonnet-4-6` - Frontier intelligence (Recommended)
2. `claude-opus-4-6` - Most intelligent
3. `claude-opus-4-5` - Industry leader
4. `claude-haiku-4-5` - Fast & efficient
5. `claude-sonnet-4-5` - Enterprise workflows
6. `claude-opus-4-1` - Long tasks
7. `claude-sonnet-4` - High-volume
8. `claude-opus-4` - State-of-the-art coding

Claude 3.x Series:
9. `claude-3-7-sonnet` - Extended thinking
10. `claude-3-5-sonnet-v2` - Enhanced agents
11. `claude-3-5-sonnet` - Cost-effective
12. `claude-3-5-haiku` - Fastest
13. `claude-3-opus` - Deprecated
14. `claude-3-haiku` - Deprecated

#### Testing
- ✅ Claude Sonnet 4.6 tested and working
- ✅ Model selection menu tested
- ✅ Direct model name input tested
- ✅ Configuration persistence verified

#### For Contributors
This update makes the project more suitable for open-source contributions by:
- Providing complete model coverage
- Adding comprehensive documentation
- Making model selection more user-friendly
- Including regional availability information

---

## Earlier Changes

See git history for previous changes.
