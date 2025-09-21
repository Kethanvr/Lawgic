#!/usr/bin/env python3
"""
Test script to verify all dependencies can be installed and imported correctly.
Run this before deploying to catch any build errors locally.
"""

import subprocess
import sys
import os

def test_requirements():
    """Test if all requirements can be installed"""
    print("🔍 Testing requirements.txt...")
    
    try:
        # Test pip install in dry-run mode
        result = subprocess.run([
            sys.executable, "-m", "pip", "install", 
            "--dry-run", "--report", "-", "-r", "requirements.txt"
        ], capture_output=True, text=True, check=True)
        
        print("✅ Requirements can be installed successfully")
        return True
        
    except subprocess.CalledProcessError as e:
        print(f"❌ Error installing requirements: {e}")
        print(f"Error output: {e.stderr}")
        return False

def test_imports():
    """Test if all required modules can be imported"""
    print("\n🔍 Testing imports...")
    
    required_modules = [
        "streamlit",
        "google.generativeai",
        "dotenv",
        "langchain_google_genai",
        "langchain",
        "langchain_community",
        "pypdf",
        "docx",
        "faiss",
        "fitz",  # PyMuPDF
        "tiktoken"
    ]
    
    failed_imports = []
    
    for module in required_modules:
        try:
            if module == "google.generativeai":
                import google.generativeai as genai
            elif module == "dotenv":
                from dotenv import load_dotenv
            elif module == "langchain_google_genai":
                from langchain_google_genai import GoogleGenerativeAIEmbeddings, ChatGoogleGenerativeAI
            elif module == "langchain":
                from langchain.text_splitter import RecursiveCharacterTextSplitter
                from langchain.chains.question_answering import load_qa_chain
                from langchain.chains.summarize import load_summarize_chain
                from langchain.prompts import PromptTemplate
            elif module == "langchain_community":
                from langchain_community.vectorstores import FAISS
            elif module == "pypdf":
                import pypdf
            elif module == "docx":
                from docx import Document
            elif module == "faiss":
                import faiss
            elif module == "fitz":
                import fitz
            elif module == "tiktoken":
                import tiktoken
            else:
                __import__(module)
            
            print(f"✅ {module}")
            
        except ImportError as e:
            print(f"❌ {module}: {e}")
            failed_imports.append(module)
    
    if failed_imports:
        print(f"\n❌ Failed to import: {', '.join(failed_imports)}")
        return False
    else:
        print("\n✅ All imports successful!")
        return True

def test_app_import():
    """Test if the main app can be imported"""
    print("\n🔍 Testing app.py import...")
    
    try:
        # Try to import the app module
        import app
        print("✅ app.py imports successfully")
        return True
    except Exception as e:
        print(f"❌ Error importing app.py: {e}")
        return False

def main():
    """Run all tests"""
    print("🚀 Testing Lawgic build locally...\n")
    
    # Check if we're in the right directory
    if not os.path.exists("app.py"):
        print("❌ app.py not found. Please run this script from the project root directory.")
        return False
    
    if not os.path.exists("requirements.txt"):
        print("❌ requirements.txt not found. Please run this script from the project root directory.")
        return False
    
    # Run tests
    tests_passed = 0
    total_tests = 3
    
    if test_requirements():
        tests_passed += 1
    
    if test_imports():
        tests_passed += 1
    
    if test_app_import():
        tests_passed += 1
    
    # Summary
    print(f"\n📊 Test Results: {tests_passed}/{total_tests} tests passed")
    
    if tests_passed == total_tests:
        print("🎉 All tests passed! Ready for deployment.")
        return True
    else:
        print("⚠️  Some tests failed. Please fix the issues before deploying.")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
