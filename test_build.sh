#!/bin/bash

# Test build script for Lawgic
# Run this to test if the app can build successfully before deploying

echo "🚀 Testing Lawgic build locally..."

# Check if we're in the right directory
if [ ! -f "app.py" ]; then
    echo "❌ app.py not found. Please run this script from the project root directory."
    exit 1
fi

if [ ! -f "requirements.txt" ]; then
    echo "❌ requirements.txt not found. Please run this script from the project root directory."
    exit 1
fi

# Create a virtual environment for testing
echo "📦 Creating test virtual environment..."
python -m venv test_env

# Activate virtual environment
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows
    source test_env/Scripts/activate
else
    # Unix/Linux/macOS
    source test_env/bin/activate
fi

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install requirements
echo "📥 Installing requirements..."
pip install -r requirements.txt

# Test imports
echo "🔍 Testing imports..."
python test_build.py

# Clean up
echo "🧹 Cleaning up test environment..."
deactivate
rm -rf test_env

echo "✅ Build test completed!"
