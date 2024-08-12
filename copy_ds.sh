#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 --path /path/to/dataset"
    exit 1
}

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    usage
fi

# Parse the input arguments
while [ "$1" != "" ]; do
    case $1 in
        --path )           shift
                           DATASET_PATH=$1
                           ;;
        * )                usage
                           ;;
    esac
    shift
done

# Check if DATASET_PATH is provided
if [ -z "$DATASET_PATH" ]; then
    usage
fi

# Define the destination directory
DEST_DIR="SimpleTuner/dataset"

# Create the destination directory if it does not exist
mkdir -p $DEST_DIR

# Copy the dataset
echo "Copying dataset from $DATASET_PATH to $DEST_DIR..."
cp -r "$DATASET_PATH"/* "$DEST_DIR"

echo "Dataset copied successfully!"
