#!/bin/bash

# Setup Script for ML Project Kernel
# This script creates a conda environment, installs dependencies from requirements.txt, and registers a Jupyter kernel

set -e  # Exit on error

echo "================================"
echo "ML Project Kernel Setup"
echo "================================"
echo ""

# Step 1: Create conda environment
echo "Step 1: Creating conda environment 'ml_project'..."
conda create -n ml_project python=3.10 -y
echo "✓ Conda environment created"
echo ""

# Step 2: Activate environment
echo "Step 2: Activating environment..."
source $(conda info --base)/etc/profile.d/conda.sh
conda activate ml_project
echo "✓ Environment activated"
echo ""

# Step 3: Install dependencies
echo "Step 3: Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt
echo "✓ Dependencies installed"
echo ""

# Step 4: Download NLTK data
echo "Step 4: Downloading NLTK data (stopwords, wordnet, punkt)..."
python -c "
import nltk
nltk.download('stopwords', quiet=True)
nltk.download('wordnet', quiet=True)
nltk.download('punkt', quiet=True)
print('✓ NLTK data downloaded')
"
echo ""

# Step 5: Register Jupyter kernel
echo "Step 5: Registering Jupyter kernel..."
python -m ipykernel install --user --name ml_project --display-name "Python 3.10 (ml_project)"
echo "✓ Kernel registered"
echo ""

# Step 6: Verify installation
echo "Step 6: Verifying installation..."
echo "Python version:"
python --version
echo ""
echo "Checking imports..."
python -c "
import pandas, numpy, sklearn, matplotlib, nltk, joblib, scipy, ipykernel
print('✓ All packages imported successfully!')
"
echo ""

# Step 7: List kernels
echo "Step 7: Available Jupyter kernels:"
jupyter kernelspec list
echo ""

echo "================================"
echo "✓ Setup Complete!"
echo "================================"
echo ""
echo "Next steps:"
echo "1. Open VS Code"
echo "2. Open your notebook file"
echo "3. Click the kernel selector (top-right)"
echo "4. Select 'Python 3.10 (ml_project)'"
echo "5. Run your cells!"
echo ""
echo "To use this environment in the future, run:"
echo "  conda activate ml_project"
echo ""