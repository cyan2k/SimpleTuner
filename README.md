
# SimpleTuner

## Introduction

SimpleTuner is a streamlined tool designed to simplify the process of fine-tuning models. This guide will walk you through the easy installation process and how to get started with your own dataset.

## Prerequisites

To get started with SimpleTuner, you'll need access to a machine with the following specifications:
- **48GB VRAM**
- **150GB Temporary Storage**
- **150GB Persistent Storage**
- **PyTorch 2.1**
- **CUDA 11.8**

You can set up your environment on [RunPod](https://runpod.io) with these specifications. Please refer to the screenshots for guidance:
- [Environment Setup Screenshot 1](img/1.png)
- [Environment Setup Screenshot 2](img/2.png)

## Installation

Follow these steps to install and set up SimpleTuner:

1. **Clone the Repository**

   Clone the SimpleTuner repository from GitHub using the following command:
   ```bash
   git clone https://github.com/cyan2k/SimpleTuner
   ```
   
2. **Run the Setup Script**

   Navigate to the SimpleTuner directory and run the setup script:
   ```bash
   cd SimpleTuner
   bash setup.sh
   ```

3. **Prepare Your Dataset**

   Copy your dataset into the `SimpleTuner/dataset` directory. You can do this manually, or by running the provided script:
   ```bash
   bash copy_ds.sh --path dataset
   ```

## Training

Once your environment is set up and your dataset is prepared, start the training process by running:
```bash
bash train.sh
```

## Conclusion

That's it! SimpleTuner should now be up and running. Happy tuning!
