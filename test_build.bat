@echo off
REM Test build script for Lawgic (Windows)
REM Run this to test if the app can build successfully before deploying

echo 🚀 Testing Lawgic build locally...

REM Check if we're in the right directory
if not exist "app.py" (
    echo ❌ app.py not found. Please run this script from the project root directory.
    exit /b 1
)

if not exist "requirements.txt" (
    echo ❌ requirements.txt not found. Please run this script from the project root directory.
    exit /b 1
)

REM Create a virtual environment for testing
echo 📦 Creating test virtual environment...
python -m venv test_env

REM Activate virtual environment
call test_env\Scripts\activate.bat

REM Upgrade pip
echo ⬆️  Upgrading pip...
python -m pip install --upgrade pip

REM Install requirements
echo 📥 Installing requirements...
pip install -r requirements.txt

REM Test imports
echo 🔍 Testing imports...
python test_build.py

REM Clean up
echo 🧹 Cleaning up test environment...
call test_env\Scripts\deactivate.bat
rmdir /s /q test_env

echo ✅ Build test completed!
pause
