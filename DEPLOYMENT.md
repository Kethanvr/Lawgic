# 🚀 Lawgic Deployment Guide

## Quick Deploy to Render

### Method 1: One-Click Deploy

1. Click the "Deploy to Render" button in the README
2. Connect your GitHub account
3. Set your `API_KEY` environment variable
4. Deploy!

### Method 2: Manual Deploy

1. **Fork this repository** to your GitHub account
2. **Create Render account** at [render.com](https://render.com)
3. **Connect GitHub** and select your forked repository
4. **Create Web Service** with these settings:
   - **Name:** `lawgic-legal-ai` (or your preferred name)
   - **Environment:** `Python 3.11.10`
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `streamlit run app.py --server.port=$PORT --server.address=0.0.0.0 --server.headless=true --server.fileWatcherType=none --server.enableCORS=false --server.enableXsrfProtection=false`
5. **Add Environment Variable:**
   - Key: `API_KEY`
   - Value: Your Google Gemini API key
6. **Deploy!**

## Environment Variables Required

| Variable  | Description           | How to Get                                       |
| --------- | --------------------- | ------------------------------------------------ |
| `API_KEY` | Google Gemini API key | [Google AI Studio](https://aistudio.google.com/) |

## Troubleshooting

### Common Issues:

1. **Build fails**: Check that all dependencies in `requirements.txt` are compatible
2. **App crashes on startup**: Verify your `API_KEY` is correctly set
3. **Quota exceeded**: Upgrade to paid Google AI plan for full features

### Render-specific:

- Make sure your start command includes all the server flags
- The app will be available at `https://your-app-name.onrender.com`
- Free tier has some limitations (sleeps after 15 minutes of inactivity)

## Alternative Platforms

### Streamlit Cloud

1. Push to GitHub
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Connect repository
4. Add secrets: `API_KEY`
5. Deploy

### Heroku

1. Create `Procfile` (already included)
2. Use Heroku CLI or web interface
3. Set environment variables
4. Deploy

## Security Notes

- Never commit your `.env` file
- Use environment variables for sensitive data
- The `.gitignore` file protects sensitive files
