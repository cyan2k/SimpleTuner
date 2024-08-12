#!/bin/bash

# Create a virtual environment
python -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip and install Poetry
pip install -U poetry pip

# Install dependencies without installing the package itself
poetry install --no-root

# Uninstall the existing diffusers package
pip uninstall -y diffusers

# Install diffusers from the Hugging Face GitHub repository
pip install git+https://github.com/huggingface/diffusers

# Install SentencePiece
pip install SentencePiece

# Log in to Hugging Face (you'll be prompted to enter your credentials)
huggingface-cli login

# Execute the training script
bash train.sh
