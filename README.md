
# SimpleTuner

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
   
2. **Run the Install Script**

   Navigate to the SimpleTuner directory and run the install script:
   ```bash
   cd SimpleTuner
   bash install.sh
   ```

   At the end you will get asked to provide a huggingface token. Create one here: https://huggingface.co/settings/tokens

3. **Run the Start Script**

   The script prepares your dataset and the most important parameters
   ```bash
   bash start.sh --path "path-to-your-dataset" --validation_prompt "your validation prompt" --seed 1234 --batch-size 4 --lr 2e-4
   ```

## Conclusion

That's it! SimpleTuner should now be up and running. Happy tuning!
