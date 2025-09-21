@echo off
echo Starting Lawgic Legal AI Assistant...
echo.

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Start Streamlit server
echo Starting server on http://localhost:8501
echo Press Ctrl+C to stop the server
echo.
streamlit run app.py

pause
