#!/bin/bash

# Function to display progress
show_progress() {
    echo -n "["
    for ((i=0; i<$1; i+=2)); do
        echo -n "#"
    done
    for ((i=$1; i<50; i+=2)); do
        echo -n " "
    done
    echo -n "]"
    echo -ne " ($1%)\r"
}

# Function to log output
log() {
    echo "$1" | tee -a setup.log
}

# Initialize progress and log file
progress=0
log "Starting setup..."
show_progress $progress

# Step 1: Create a virtual environment
log "Creating virtual environment..."
python -m venv venv &>> setup.log
progress=16
show_progress $progress

# Step 2: Activate the virtual environment
log "Activating virtual environment..."
source venv/bin/activate &>> setup.log
progress=33
show_progress $progress

# Step 3: Upgrade pip and install Poetry
log "Upgrading pip and installing Poetry..."
pip install -U poetry pip &>> setup.log
progress=50
show_progress $progress

# Step 4: Install dependencies without installing the package itself
log "Installing dependencies with Poetry (no-root)..."
poetry install --no-root &>> setup.log
progress=66
show_progress $progress

# Step 5: Uninstall existing diffusers package
log "Uninstalling existing diffusers package..."
pip uninstall -y diffusers &>> setup.log
progress=83
show_progress $progress

# Step 6: Install diffusers from the Hugging Face GitHub repository
log "Installing diffusers from Hugging Face GitHub repository..."
pip install git+https://github.com/huggingface/diffusers &>> setup.log
progress=100
show_progress $progress

# Step 7: Install SentencePiece
log "Installing SentencePiece..."
pip install SentencePiece &>> setup.log
progress=100
show_progress $progress

# Completion message
log "Setup complete!"
echo -e "\nSetup completed successfully!"
