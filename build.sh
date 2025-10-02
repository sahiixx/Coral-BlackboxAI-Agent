#!/bin/bash
set -e

echo "======================================="
echo "Coral BlackboxAI Agent - Build Script"
echo "======================================="
echo ""

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Project directory: $SCRIPT_DIR"
echo ""

# Check if uv is installed
if ! command -v uv &> /dev/null; then
    echo "UV not found. Installing UV..."
    
    # Try to install via pip
    if command -v pip &> /dev/null || command -v pip3 &> /dev/null; then
        echo "Installing UV using pip..."
        pip install uv || pip3 install uv
    else
        echo "Error: pip not found. Please install Python and pip first."
        exit 1
    fi
    
    echo "UV installed successfully."
    echo ""
fi

echo "UV version: $(uv --version)"
echo ""

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    uv venv .venv
    echo "Virtual environment created."
    echo ""
else
    echo "Virtual environment already exists."
    echo ""
fi

# Install dependencies
echo "Installing dependencies..."
uv sync
echo ""

echo "======================================="
echo "Build completed successfully!"
echo "======================================="
echo ""
echo "To activate the virtual environment, run:"
echo "  source .venv/bin/activate"
echo ""
echo "To run the agent, use:"
echo "  uv run python main.py"
echo ""
