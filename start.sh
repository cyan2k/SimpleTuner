#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 --path /path/to/dataset --validation_prompt \"your validation prompt\" --seed 1234 --batch-size 4 --lr 2e-4"
    exit 1
}

# Initialize variables
DATASET_PATH=""
VALIDATION_PROMPT=""
SEED=""
BATCH_SIZE=""
LEARNING_RATE=""

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    usage
fi

# Parse the input arguments
while [ "$1" != "" ]; do
    case $1 in
        --path )               shift
                               DATASET_PATH=$1
                               ;;
        --validation_prompt )  shift
                               VALIDATION_PROMPT=$1
                               ;;
        --seed )               shift
                               SEED=$1
                               ;;
        --batch-size )         shift
                               BATCH_SIZE=$1
                               ;;
        --lr )                 shift
                               LEARNING_RATE=$1
                               ;;
        * )                    usage
                               ;;
    esac
    shift
done

# Check if required arguments are provided
if [ -z "$DATASET_PATH" ] || [ -z "$VALIDATION_PROMPT" ] || [ -z "$SEED" ] || [ -z "$BATCH_SIZE" ] || [ -z "$LEARNING_RATE" ]; then
    echo "Error: All parameters (path, validation_prompt, seed, batch-size, lr) are required."
    usage
fi

# Copy configuration files
echo "Copying example configuration files to config directory..."
cp config/cyan_config.env.example config/config.env
cp config/cyan_multidatabackend.json.example config/multidatabackend.json
echo "Configuration files copied successfully!"

# Define the destination directory
DEST_DIR="dataset"

# Create the destination directory if it does not exist
mkdir -p $DEST_DIR

# Copy the dataset
echo "Copying dataset from $DATASET_PATH to $DEST_DIR..."
cp -r "$DATASET_PATH"/* "$DEST_DIR"
echo "Dataset copied successfully!"

# Update the config file with provided parameters
CONFIG_FILE="config/config.env"

if [ -f "$CONFIG_FILE" ]; then
    echo "Updating parameters in $CONFIG_FILE..."

    # Update validation prompt
    sed -i "/^export VALIDATION_PROMPT=/c\\export VALIDATION_PROMPT='$VALIDATION_PROMPT'" "$CONFIG_FILE"

    # Update seed
    sed -i "/^export TRAINING_SEED=/c\\export TRAINING_SEED=$SEED" "$CONFIG_FILE"
    sed -i "/^export VALIDATION_SEED=/c\\export VALIDATION_SEED=$SEED" "$CONFIG_FILE"
    
    # Update batch size
    sed -i "/^export TRAIN_BATCH_SIZE=/c\\export TRAIN_BATCH_SIZE=$BATCH_SIZE" "$CONFIG_FILE"

    # Update learning rate
    sed -i "/^export LEARNING_RATE=/c\\export LEARNING_RATE=$LEARNING_RATE" "$CONFIG_FILE"

    echo "Parameters updated successfully!"
else
    echo "Error: Config file $CONFIG_FILE not found. Please ensure it exists."
    exit 1
fi