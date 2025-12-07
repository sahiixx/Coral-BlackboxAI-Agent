# 🚀 Coral-BlackboxAI Agent - Quick Start Guide

## One-Time Setup (First Run)

```bash
# 1. Install UV package manager
python3 -m pip install uv

# 2. Create virtual environment with Python 3.12.12
python3 -m uv venv --python 3.12.12

# 3. Install all dependencies
uv sync

# 4. Configure environment variables
cp .env.example .env
# Edit .env and add your BLACKBOXAI_API_KEY
```

## Verify Setup

```bash
# Activate virtual environment
source .venv/bin/activate

# Run test mode to verify everything is working
python main.py --test

# Show help and available options
python main.py --help
```

## Run the Agent

```bash
# Activate virtual environment
source .venv/bin/activate

# Run the agent in production mode
python main.py
```

## Required Environment Variables

**Edit `.env` file and set:**

```env
BLACKBOXAI_API_KEY=your_actual_api_key_here
BLACKBOXAI_URL=https://api.blackbox.ai
MODEL_NAME=blackboxai/openai/gpt-4.1-mini
CORAL_SSE_URL=http://localhost:5555/devmode/exampleApplication/privkey/session1/sse
CORAL_AGENT_ID=blackboxai_agent
CORAL_ORCHESTRATION_RUNTIME=devmode
```

Get your API key from: https://www.blackbox.ai

## Command Reference

```bash
python main.py              # Run agent in production mode
python main.py --test       # Run test mode (verify setup)
python main.py --help       # Show help message
python main.py --version    # Show version
```

## Need Help?

See `SETUP_SUMMARY.md` for detailed documentation.
