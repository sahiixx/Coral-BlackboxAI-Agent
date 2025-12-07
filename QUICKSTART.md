# 🚀 Coral-BlackboxAI Agent - Quick Start Guide

## One-Time Setup (First Run)

```bash
# 1. Install UV package manager
python3 -m pip install uv

# 2. Create virtual environment with Python 3.12
python3 -m uv venv --python 3.12

# 3. Install all dependencies
python3 -m uv sync

# 4. Configure environment variables
cp .env.example .env
# Edit .env and add your BLACKBOXAI_API_KEY
```

## Run the Agent

```bash
# Activate virtual environment
source .venv/bin/activate

# Run the agent
python main.py
```

## Required Environment Variables

**Edit `.env` file and set:**

```env
BLACKBOXAI_API_KEY=your_actual_api_key_here
```

Get your API key from: https://www.blackbox.ai

## Verify Setup

```bash
source .venv/bin/activate
python -c "import langchain; print('✓ Setup successful!')"
```

## Need Help?

See `SETUP_SUMMARY.md` for detailed documentation.
