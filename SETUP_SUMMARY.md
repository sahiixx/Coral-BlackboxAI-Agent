# Coral-BlackboxAI Agent - Setup Summary

## ✅ Project Status: READY TO RUN

The Coral-BlackboxAI Agent project has been fully configured and is ready for local development and deployment.

---

## 🔧 Changes Made

### 1. **Python Version Selection**
- **Selected**: Python 3.12.12 (CPython)
- **Reason**: Python 3.14 had compatibility issues with Pydantic V1 used by LangChain
- **Status**: Virtual environment created with Python 3.12.12

### 2. **Dependency Management**
- **Tool**: UV package manager (v0.9.16)
- **Action**: All 72 dependencies installed and locked
- **Lock File**: `uv.lock` created with pinned versions for reproducible builds
- **Key Dependencies**:
  - `langchain==0.3.25`
  - `langchain-openai==0.3.26`
  - `langchain-mcp-adapters==0.1.7`
  - `mcp==1.23.1`
  - `openai==1.109.1`
  - `pydantic==2.12.5`
  - `python-dotenv==1.2.1`

### 3. **Environment Configuration**
- **Created**: `.env` file from `.env.example`
- **Status**: Configured with placeholder values for testing
- **Location**: `/vercel/sandbox/.env`

### 4. **Verification**
- ✅ All Python imports successful
- ✅ Environment variables load correctly
- ✅ main.py executes without import errors
- ✅ Dependencies properly installed in virtual environment

---

## 🚀 How to Run Locally

### Step 1: Install Prerequisites
```bash
# Install pip (if not already installed)
python3 -m ensurepip --upgrade

# Install UV package manager
python3 -m pip install uv
```

### Step 2: Set Up Virtual Environment
```bash
# Create virtual environment with Python 3.12
python3 -m uv venv --python 3.12

# Activate virtual environment
source .venv/bin/activate  # On Linux/Mac
# OR
.venv\Scripts\activate     # On Windows
```

### Step 3: Install Dependencies
```bash
# Install all locked dependencies
python3 -m uv sync
```

### Step 4: Configure Environment Variables
```bash
# Copy the example environment file
cp .env.example .env

# Edit .env with your actual values (see below)
nano .env  # or use your preferred editor
```

### Step 5: Verify Setup (Recommended)
```bash
# Activate virtual environment (if not already active)
source .venv/bin/activate

# Run test mode to verify everything is working
python main.py --test

# Show available commands
python main.py --help
```

### Step 6: Run the Agent
```bash
# Activate virtual environment (if not already active)
source .venv/bin/activate

# Run the agent in production mode
python main.py
```

**Alternative**: Use the provided shell script:
```bash
chmod +x run_agent.sh
./run_agent.sh
```

**Available Commands**:
- `python main.py` - Run agent in production mode
- `python main.py --test` - Run test mode (verify setup)
- `python main.py --help` - Show help message
- `python main.py --version` - Show version

---

## 🔐 Required Environment Variables

You **MUST** set these environment variables in your `.env` file:

### 1. **BLACKBOXAI_API_KEY** (Required)
- **Description**: Your BlackboxAI API key for authentication
- **Example**: `BLACKBOXAI_API_KEY=sk-blackbox-1234567890abcdef`
- **How to Get**: Sign up at https://www.blackbox.ai and generate an API key
- **⚠️ Important**: Replace `test_placeholder_key_12345` with your real API key

### 2. **BLACKBOXAI_URL** (Optional)
- **Description**: BlackboxAI API endpoint
- **Default**: `https://api.blackbox.ai`
- **Example**: `BLACKBOXAI_URL=https://api.blackbox.ai`
- **Note**: Usually doesn't need to be changed

### 3. **MODEL_NAME** (Optional)
- **Description**: The AI model to use
- **Default**: `blackboxai/openai/gpt-4.1-mini`
- **Example**: `MODEL_NAME=blackboxai/openai/gpt-4.1-mini`
- **Note**: Check BlackboxAI documentation for available models

### 4. **CORAL_SSE_URL** (Required for Production)
- **Description**: Coral Protocol SSE endpoint for agent orchestration
- **Example**: `CORAL_SSE_URL=http://localhost:5555/devmode/exampleApplication/privkey/session1/sse`
- **Note**: This should point to your Coral orchestration server
- **Development**: Use the default localhost URL for testing
- **Production**: Replace with your actual Coral server URL

### 5. **CORAL_AGENT_ID** (Optional)
- **Description**: Unique identifier for this agent in the Coral network
- **Default**: `blackboxai_agent`
- **Example**: `CORAL_AGENT_ID=blackboxai_agent`

### 6. **CORAL_ORCHESTRATION_RUNTIME** (Optional)
- **Description**: Runtime environment mode
- **Options**: `devmode`, `docker`, `executable`
- **Default**: `devmode` (if not set)
- **Example**: `CORAL_ORCHESTRATION_RUNTIME=devmode`

---

## 📋 Complete .env Template

```env
# BlackboxAI Configuration
BLACKBOXAI_API_KEY=your_actual_api_key_here
BLACKBOXAI_URL=https://api.blackbox.ai
MODEL_NAME=blackboxai/openai/gpt-4.1-mini

# Coral Protocol Configuration
CORAL_SSE_URL=http://localhost:5555/devmode/exampleApplication/privkey/session1/sse
CORAL_AGENT_ID=blackboxai_agent
CORAL_ORCHESTRATION_RUNTIME=devmode
```

---

## 🧪 Testing the Setup

### Test 1: Run Built-in Test Mode (Recommended)
```bash
source .venv/bin/activate
python main.py --test
```

**This will verify**:
- ✓ All environment variables are properly set
- ✓ All required imports work correctly
- ✓ ChatOpenAI model can be initialized
- ✓ Configuration is valid and ready

### Test 2: Show Help and Available Commands
```bash
source .venv/bin/activate
python main.py --help
```

### Test 3: Manual Import Verification
```bash
source .venv/bin/activate
python -c "import langchain; import langchain_openai; import langchain_mcp_adapters; print('✓ All imports successful')"
```

### Test 4: Run the Agent in Production Mode
```bash
source .venv/bin/activate
python main.py
```

**Expected Behavior**:
- The agent will attempt to connect to the Coral server
- If the Coral server is not running, you'll see a connection error (this is normal)
- If the Coral server is running, the agent will start listening for mentions

---

## 🐳 Docker Deployment

### Build Docker Image
```bash
chmod +x build.sh
./build.sh
```

### Run Docker Container
```bash
docker run -d \
  --name coral-blackboxai-agent \
  -e BLACKBOXAI_API_KEY=your_api_key \
  -e CORAL_SSE_URL=http://your-coral-server:5555/... \
  coral-blackboxai-agent:latest
```

---

## 📦 Project Structure

```
/vercel/sandbox/
├── .env                    # Environment variables (created)
├── .env.example            # Environment template
├── .venv/                  # Virtual environment (created)
├── main.py                 # Main agent entry point
├── pyproject.toml          # Project dependencies
├── uv.lock                 # Locked dependency versions (created)
├── README.md               # Project documentation
├── Dockerfile              # Docker build configuration
├── build.sh                # Docker build script
├── run_agent.sh            # Agent run script
└── SETUP_SUMMARY.md        # This file
```

---

## 🔍 Troubleshooting

### Issue: "uv: command not found"
**Solution**: Use `python3 -m uv` instead of `uv` directly

### Issue: "No module named 'langchain'"
**Solution**: Ensure virtual environment is activated and dependencies are installed:
```bash
source .venv/bin/activate
python3 -m uv sync
```

### Issue: "Connection refused" when running main.py
**Solution**: This is expected if the Coral server is not running. Start your Coral orchestration server first.

### Issue: "Invalid API key"
**Solution**: Replace the placeholder API key in `.env` with your actual BlackboxAI API key

### Issue: Python version compatibility errors
**Solution**: Ensure you're using Python 3.12 (not 3.14):
```bash
python3 -m uv venv --python 3.12
```

---

## 📚 Additional Resources

- **BlackboxAI Documentation**: https://www.blackbox.ai/docs
- **Coral Protocol**: Check your Coral server documentation
- **LangChain Documentation**: https://python.langchain.com/
- **UV Package Manager**: https://github.com/astral-sh/uv

---

## ✨ Summary

**What's Ready**:
- ✅ Virtual environment with Python 3.12.12
- ✅ All 72 dependencies installed and locked
- ✅ Environment configuration file created
- ✅ All imports verified working
- ✅ main.py ready to execute

**What You Need to Do**:
1. Get a BlackboxAI API key from https://www.blackbox.ai
2. Update `BLACKBOXAI_API_KEY` in `.env` with your real key
3. Ensure your Coral orchestration server is running
4. Update `CORAL_SSE_URL` in `.env` if needed
5. Run `source .venv/bin/activate && python main.py`

**The agent is now ready for development and deployment! 🎉**
