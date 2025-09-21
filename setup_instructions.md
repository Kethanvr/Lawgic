# Lawgic - Legal AI Assistant Setup Instructions

## 🚀 Deploy on Render (Recommended)

### Step 1: Prepare Your Repository

1. Make sure all files are committed to your Git repository
2. Ensure your `.env` file contains your Google API key:
   ```
   API_KEY=your_google_api_key_here
   ```

### Step 2: Deploy on Render

1. Go to [render.com](https://render.com) and sign up/login
2. Click "New +" and select "Web Service"
3. Connect your GitHub/GitLab repository
4. Configure the service:
   - **Name**: `lawgic-legal-ai` (or any name you prefer)
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `streamlit run app.py --server.port=$PORT --server.address=0.0.0.0 --server.headless=true --server.fileWatcherType=none`
5. Add Environment Variable:
   - **Key**: `API_KEY`
   - **Value**: Your Google API key
6. Click "Create Web Service"

### Step 3: Access Your App

- Your app will be available at: `https://your-app-name.onrender.com`
- Initial deployment may take 5-10 minutes

## 💻 Local Development Setup

### Prerequisites

- Python 3.8 or higher
- Google API Key (from Google AI Studio)

### Step 1: Clone and Navigate

```bash
git clone <your-repository-url>
cd ClearClause-Legal-AI-Assistant
```

### Step 2: Create Virtual Environment

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### Step 3: Install Dependencies

```bash
pip install -r requirements.txt
```

### Step 4: Set Up Environment Variables

Create a `.env` file in the project root:

```
API_KEY=your_google_api_key_here
```

### Step 5: Run the Application

```bash
streamlit run app.py
```

### Step 6: Access the App

- Open your browser and go to: `http://localhost:8501`

## 🔧 Troubleshooting

### Common Issues:

1. **API Key Error**: Make sure your Google API key is valid and has Gemini API access
2. **Port Issues**: If port 8501 is busy, Streamlit will automatically use the next available port
3. **Dependencies**: If you get import errors, try: `pip install --upgrade -r requirements.txt`

### Getting Google API Key:

1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Copy the key and add it to your `.env` file

## 📁 Project Structure

```
ClearClause-Legal-AI-Assistant/
├── app.py                 # Main Streamlit application
├── requirements.txt       # Python dependencies
├── render.yaml           # Render deployment config
├── .env                  # Environment variables (create this)
├── logo.png             # App logo
└── setup_instructions.md # This file
```

## 🎯 Features

- **Document Q&A**: Upload PDF/DOCX files and ask questions
- **General Legal Q&A**: Ask general legal questions
- **Document Summarization**: Generate custom summaries
- **Translation**: Translate text to 6 Indian languages
- **Multi-language Support**: Marathi, Hindi, Kannada, Tamil, Telugu, Malayalam

## 💡 Tips for Production

- Use a paid Render plan for better performance
- Consider adding authentication for sensitive legal documents
- Monitor API usage to avoid quota limits
- Regular backups of important documents
