@echo off
echo 🚀 Setting up Lawgic Legal AI Assistant...

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed. Please install Python 3.8+ first.
    pause
    exit /b 1
)

REM Check if virtual environment exists
if not exist "venv" (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo 📥 Installing dependencies...
python -m pip install --upgrade pip
pip install -r requirements.txt

REM Check if .env file exists
if not exist ".env" (
    echo ⚠️  Creating .env file template...
    echo API_KEY=your_google_api_key_here > .env
    echo 📝 Please edit .env file and add your Google API key
    echo 🔗 Get your API key from: https://makersuite.google.com/app/apikey
    pause
)

echo ✅ Setup complete!
echo 🌐 Starting the application...
echo 📱 Open your browser and go to: http://localhost:8501
echo.

REM Run the application
streamlit run app.py
