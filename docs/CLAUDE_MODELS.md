# Claude Models on Vertex AI

Complete guide to all available Claude models on Google Cloud Vertex AI.

## 🚀 Quick Start

```bash
./vertex-cli
# Select option 1 (Configure Claude)
# Choose from 14 available models
```

---

## 📋 Available Models

### Claude 4.x Series (Latest Generation)

#### 1. claude-sonnet-4-6 ⭐ **RECOMMENDED**
- **Description**: Frontier intelligence at scale—built for coding, agents, and enterprise workflows
- **Best For**: General purpose, coding, agents, enterprise
- **Regions**: us-east5, europe-west1, asia-southeast1, global
- **Status**: Latest (2026)

#### 2. claude-opus-4-6
- **Description**: The world's best model for coding, enterprise agents, and professional work
- **Best For**: Complex coding, professional work, enterprise agents
- **Regions**: us-east5, us-west4, us-east1, us-south1, europe-west1, europe-west4, europe-north1, asia-southeast1, global
- **Status**: Most Intelligent

#### 3. claude-opus-4-5
- **Description**: Industry leader across coding, agents, computer use, and enterprise workflows
- **Best For**: Coding, agents, computer use, enterprise
- **Regions**: us-east5, europe-west1, asia-southeast1, global
- **Status**: Production Ready

#### 4. claude-haiku-4-5
- **Description**: Superior intelligence for high-volume uses in coding, research, agents, & more
- **Best For**: High-volume tasks, cost-effective operations
- **Regions**: us-east5, europe-west1, asia-east1, global
- **Status**: Fast & Efficient

#### 5. claude-sonnet-4-5
- **Description**: Most powerful model for real-world agents with industry-leading capabilities
- **Best For**: Agents, computer use, cybersecurity, office files
- **Regions**: us-east5, europe-west1, asia-southeast1, global
- **Status**: Production Ready

#### 6. claude-opus-4-1
- **Description**: Delivers sustained performance on long-running tasks requiring thousands of steps
- **Best For**: Long-running tasks, frontier agent products
- **Regions**: us-east5, europe-west4, global
- **Status**: Agent-focused

#### 7. claude-sonnet-4
- **Description**: Mid-size model with superior intelligence for high-volume coding & research
- **Best For**: High-volume coding, in-depth research, agents
- **Regions**: us-east5, europe-west4, global
- **Status**: Balanced Performance

#### 8. claude-opus-4
- **Description**: State-of-the-art coding model with sustained performance on complex tasks
- **Best For**: Long-running coding tasks, frontier agents
- **Regions**: us-east5, europe-west4, global
- **Status**: Coding Champion

---

### Claude 3.x Series

#### 9. claude-3-7-sonnet
- **Description**: First Claude model to offer extended thinking capabilities
- **Best For**: Industry-leading coding, AI agents with thinking
- **Regions**: us-east5, europe-west1, europe-west4, global
- **Status**: Extended Thinking

#### 10. claude-3-5-sonnet-v2
- **Description**: Enhanced agentic capabilities, computer use, and software engineering
- **Best For**: Real-world software engineering, agentic tasks
- **Regions**: us-east5, europe-west1, global
- **Status**: Enhanced Version

#### 11. claude-3-5-sonnet
- **Description**: Outperforms competitor models at higher speeds and lower cost
- **Best For**: General purpose, cost-effective, powerful
- **Regions**: us-east5, europe-west1, asia-southeast1
- **Status**: Popular Choice

#### 12. claude-3-5-haiku
- **Description**: Fastest and most cost-effective model for code and test generation
- **Best For**: Sub-agents, user-facing chatbots, test generation
- **Regions**: us-east5
- **Status**: Speed Optimized

#### 13. claude-3-opus (Deprecated)
- **Description**: Top-level performance on highly complex tasks
- **Best For**: Complex tasks requiring high intelligence
- **Regions**: us-east5
- **Status**: Deprecated

#### 14. claude-3-haiku (Deprecated)
- **Description**: Fastest, most compact model for near-instant responses
- **Best For**: Simple queries, seamless AI experiences
- **Regions**: us-east5, europe-west1, asia-southeast1
- **Status**: Deprecated

---

## 🌍 Regional Availability

### Global Regions
- **global**: Automatic routing to best available region

### US Regions
- **us-east5** (Columbus, Ohio) - Most models available ⭐
- **us-east4** (Virginia)
- **us-east1** (South Carolina)
- **us-central1** (Iowa)
- **us-west4** (Las Vegas)
- **us-south1** (Dallas)

### Europe Regions
- **europe-west1** (Belgium) - Good availability
- **europe-west4** (Netherlands)
- **europe-north1** (Finland)

### Asia Regions
- **asia-southeast1** (Singapore) - Good availability
- **asia-east1** (Taiwan)

---

## 💡 Choosing the Right Model

### For Coding Projects
1. **claude-opus-4-6** - Best overall
2. **claude-sonnet-4-6** - Balanced performance
3. **claude-opus-4-5** - Industry leader

### For Cost Efficiency
1. **claude-haiku-4-5** - Fast & cheap
2. **claude-3-5-haiku** - Very fast
3. **claude-3-5-sonnet** - Good balance

### For AI Agents
1. **claude-opus-4-1** - Long-running tasks
2. **claude-sonnet-4-5** - Real-world agents
3. **claude-3-7-sonnet** - Extended thinking

### For Enterprise Workflows
1. **claude-opus-4-6** - Professional work
2. **claude-opus-4-5** - Enterprise workflows
3. **claude-sonnet-4-6** - Scale operations

---

## 🔧 Configuration

### Interactive Configuration
```bash
./vertex-cli
# Select option 1
# Follow the prompts
```

### Manual Configuration
Edit `~/.ai-tools-config`:
```bash
AI_TOOL=claude
PROJECT_ID=your-project-id
REGION=us-east5
MODEL=claude-sonnet-4-6
ENDPOINT=https://us-east5-aiplatform.googleapis.com
```

### Test Configuration
```bash
./vertex-cli
# Select option 8 (Test Configuration)
```

---

## 📚 Usage Examples

### Start Chatting
```bash
./bin/vertex-chat
```

### Example Interaction
```
You: Write a REST API in Python with FastAPI

AI: [Detailed implementation with best practices]
```

---

## ⚠️ Important Notes

1. **Model Garden Activation**: All models must be enabled in [Vertex AI Model Garden](https://console.cloud.google.com/vertex-ai/model-garden) before use

2. **Billing Required**: GCP project must have billing enabled

3. **Regional Availability**: Not all models are available in all regions. Choose your region based on your model selection.

4. **Deprecation**: Some Claude 3 models are deprecated. Use Claude 4.x series for new projects.

5. **Rate Limits**: Check [Vertex AI quotas](https://cloud.google.com/vertex-ai/docs/quotas) for your project

---

## 🔗 Resources

- [Claude on Vertex AI Documentation](https://cloud.google.com/vertex-ai/generative-ai/docs/partner-models/use-claude)
- [Anthropic Claude Documentation](https://docs.anthropic.com/)
- [Vertex AI Model Garden](https://console.cloud.google.com/vertex-ai/model-garden)
- [Pricing Information](https://cloud.google.com/vertex-ai/pricing)

---

## 🆘 Troubleshooting

### Model Not Found Error
1. Go to [Model Garden](https://console.cloud.google.com/vertex-ai/model-garden)
2. Search for your Claude model
3. Click "ENABLE" to activate it
4. Wait a few minutes for activation
5. Try again

### Authentication Errors
```bash
gcloud auth application-default login
```

### Region Availability
Check the regional availability list above and choose a region that supports your model.

---

## 📝 License

This is an open-source project. Claude models are provided by Anthropic through Google Cloud Vertex AI.

---

**Last Updated**: 2026-03-06
**Vertex CLI Version**: 1.0
