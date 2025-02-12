#!/bin/bash
#SBATCH --job-name=llama-export
#SBATCH --output=logs/export_%x-%j.out
#SBATCH --error=logs/export_%x-%j.err
#SBATCH --partition=INF
#SBATCH --nodes=1
#SBATCH --gres=gpu:1  # Request 1 GPU

# Load environment
source ${HOME}/.bashrc
eval "$(conda shell.bash hook)"
conda activate snullm
#/data/s1/snuit/jongmin/magpie_en/sft_outputs/adapters/
#Llama-3.1-8B-Magpie-Align-SFT-v0.2/rank16/dpo/N1048576/seed42
# Set variables
MODEL_NAME="Qwen/Qwen2.5-7B"
#MODEL_NAME="meta-llama/Llama-3.1-8B"
ADAPTER_PATH="/home/n3/jongyeon/thunder-sft/s1/Qwen2.5-7B_s1K_withreasoning/8192"
EXPORT_SIZE=4
OUTPUT_DIR="${ADAPTER_PATH}/merged_model"
#OUTPUT_DIR="/data/s1/snuit/jypark/magpie_en/sft_outputs/adapters/Llama-3.1-8B/rank16/mix/N1048576/seed42/checkpoint-5000"
# Print information
echo "🚀 Exporting model..."
echo "🔹 Model: $MODEL_NAME"
echo "🔹 Adapter: $ADAPTER_PATH"
echo "🔹 Export size: $EXPORT_SIZE"
echo "🔹 Output directory: $OUTPUT_DIR"
echo "-------------------------------------------"

# Run export command
llamafactory-cli export \
  --model_name_or_path="$MODEL_NAME" \
  --adapter_name_or_path="$ADAPTER_PATH" \
  --template="llama3" \
  --finetuning_type="lora" \
  --export_dir="$OUTPUT_DIR" \
  --export_size="$EXPORT_SIZE" \
  --export_device="auto"

echo "✅ Export completed!"