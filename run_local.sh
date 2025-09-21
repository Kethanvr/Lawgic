#!/bin/bash

# Lawgic - Local Development Setup Script
echo "🚀 Setting up Lawgic Legal AI Assistant..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8+ first."
    exit 1
fi

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "📥 Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  Creating .env file template..."
    echo "API_KEY=your_google_api_key_here" > .env
    echo "📝 Please edit .env file and add your Google API key"
    echo "🔗 Get your API key from: https://makersuite.google.com/app/apikey"
fi

echo "✅ Setup complete!"
echo "🌐 Starting the application..."
echo "📱 Open your browser and go to: http://localhost:8501"
echo ""

# Run the application
streamlit run app.py
