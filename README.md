# 📧 AI Email Assistant

A sophisticated AI-powered email writing assistant built on Cloudflare Workers, featuring Llama 3.3, Durable Objects for state management, voice input capabilities, and advanced workflow coordination.

## ✨ Features

### Core AI Components
- **LLM Integration**: Uses Llama 3.3 via Cloudflare Workers AI
- **Memory/State**: Persistent conversation history with Durable Objects
- **Workflow Coordination**: Multi-step email generation with progress tracking
- **Voice Input**: Web Speech API integration for hands-free operation

### User Interface
- **Modern UI**: Beautiful, responsive design with gradient backgrounds
- **Real-time Updates**: Live workflow progress and status updates
- **Voice Support**: Click-to-speak functionality
- **Two Generation Modes**:
  - ⚡ **Quick Generate**: Fast, simple email generation
  - 🔧 **Advanced Workflow**: Multi-step analysis and structured email creation

### Technical Architecture
- **Cloudflare Workers**: Serverless compute platform
- **Durable Objects**: State management and workflow coordination
- **Workers AI**: Llama 3.3 model integration
- **Web Speech API**: Browser-based voice recognition

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ installed
- Cloudflare account
- Wrangler CLI installed globally: `npm install -g wrangler`

### Installation

1. **Clone and navigate to the project**:
   ```bash
   cd worker-email-ai
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Authenticate with Cloudflare**:
   ```bash
   wrangler login
   ```

4. **Configure AI bindings** (if needed):
   ```bash
   wrangler ai binding create
   ```

### Development

1. **Start development server**:
   ```bash
   npm run dev
   ```

2. **Open your browser** to `http://localhost:8787`

3. **Test the application**:
   - Try typing: "Write a follow-up email to a client about project status"
   - Use voice input by clicking the microphone button
   - Test the advanced workflow for complex email generation

### Deployment

1. **Deploy to Cloudflare**:
   ```bash
   npm run deploy
   ```

2. **Your app will be available** at your Cloudflare Workers URL

## 🏗️ Architecture Overview

### Components

1. **Main Worker** (`src/worker.js`)
   - Handles HTTP requests and routing
   - Integrates AI and Durable Objects
   - Serves the frontend UI

2. **ChatMemory Durable Object** (`src/ChatMemory.js`)
   - Stores conversation history
   - Manages user session state
   - Provides conversation statistics

3. **EmailWorkflow Durable Object** (`src/EmailWorkflow.js`)
   - Coordinates complex email generation
   - Multi-step analysis and structuring
   - Progress tracking and status updates

4. **Frontend** (embedded in worker.js)
   - Modern, responsive UI
   - Voice input integration
   - Real-time workflow monitoring

### Data Flow

```
User Input → Worker → AI Processing → Durable Objects → Response
     ↓
Voice Input → Speech Recognition → Text Processing
     ↓
Workflow → Multi-step Analysis → Structured Email Generation
```

## 🔧 Configuration

### Wrangler Configuration (`wrangler.jsonc`)

```jsonc
{
  "name": "worker-email-ai",
  "main": "src/index.js",
  "compatibility_date": "2025-09-24",
  "durable_objects": {
    "bindings": [
      {
        "class_name": "ChatMemory",
        "name": "CHAT_MEMORY"
      },
      {
        "class_name": "EmailWorkflow", 
        "name": "EMAIL_WORKFLOW"
      }
    ]
  },
  "ai": {
    "binding": "AI"
  }
}
```

### Environment Variables

No additional environment variables required - the app uses Cloudflare's built-in AI bindings.

## 📱 Usage

### Quick Email Generation
1. Type your email request in the text area
2. Click "⚡ Quick Generate"
3. Get instant AI-generated email

### Advanced Workflow
1. Type your email request
2. Click "🔧 Advanced Workflow"
3. Watch the multi-step process:
   - **Analyzing**: AI analyzes your requirements
   - **Structuring**: Creates email structure and outline
   - **Generating**: Writes the final email
4. Review the professionally structured result

### Voice Input
1. Click "🎤 Voice Input"
2. Speak your email request
3. The text will be automatically filled
4. Choose Quick or Advanced generation

## 🛠️ Development

### Project Structure
```
worker-email-ai/
├── src/
│   ├── index.js          # Main worker entry point
│   ├── worker.js         # Worker implementation
│   ├── ChatMemory.js     # Memory Durable Object
│   └── EmailWorkflow.js  # Workflow Durable Object
├── wrangler.jsonc        # Cloudflare configuration
├── package.json          # Dependencies and scripts
└── README.md            # This file
```

### Available Scripts
- `npm run dev` - Start development server
- `npm run deploy` - Deploy to Cloudflare
- `npm run tail` - View real-time logs
- `npm start` - Alias for dev

### Debugging
- Use `wrangler tail` to see real-time logs
- Check Cloudflare dashboard for detailed analytics
- Use browser dev tools for frontend debugging

## 🔍 API Endpoints

### Chat API
- **POST** `/api/chat`
  - Body: `{ "userMessage": "string", "useWorkflow": boolean }`
  - Response: `{ "reply": "string", "workflowId": "string" }`

### Workflow API
- **GET** `/api/workflow/{workflowId}`
  - Response: Workflow status and progress

## 🎯 What This Application Achieves

### ✅ Required Components (All Present)

1. **LLM Integration** ✅
   - Uses Llama 3.3 via Cloudflare Workers AI
   - Professional email generation capabilities

2. **Workflow/Coordination** ✅
   - EmailWorkflow Durable Object for complex operations
   - Multi-step analysis and generation process

3. **User Input** ✅
   - Text input via modern UI
   - Voice input via Web Speech API
   - Real-time interaction

4. **Memory/State** ✅
   - ChatMemory Durable Object for conversation history
   - Persistent state across sessions

### 🚀 Enhanced Features

- **Modern UI/UX**: Beautiful, responsive design
- **Voice Input**: Hands-free operation
- **Two Generation Modes**: Quick vs Advanced
- **Real-time Progress**: Live workflow monitoring
- **Error Handling**: Comprehensive error management
- **Mobile Responsive**: Works on all devices

## 🐛 Troubleshooting

### Common Issues

1. **AI not working**:
   - Ensure you're authenticated: `wrangler login`
   - Check AI bindings are configured
   - Verify Workers AI is enabled in your account

2. **Voice input not working**:
   - Requires HTTPS in production
   - Check browser permissions for microphone
   - Some browsers may not support Web Speech API

3. **Durable Objects not persisting**:
   - Check wrangler.jsonc configuration
   - Ensure proper class names and bindings

4. **Deployment issues**:
   - Verify account permissions
   - Check compatibility date
   - Review wrangler logs

### Getting Help

- Check Cloudflare Workers documentation
- Review wrangler CLI help: `wrangler --help`
- Check browser console for frontend errors
- Use `wrangler tail` for real-time debugging

## 📄 License

MIT License - feel free to use this project as a starting point for your own AI applications!

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

**Built with ❤️ using Cloudflare Workers, Llama 3.3, and modern web technologies**
