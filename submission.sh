#!/bin/bash
#SBATCH --exclusive
#SBATCH --gres=gpu:4
#SBATCH --nodes=4 # configure node count
#SBATCH --job-name=s1_Test
#SBATCH --output=logs/s1_Test/%x-%j.out
#SBATCH --error=logs/s1_Test/%x-%j.err
#SBATCH --partition INF


config_path=/home/n3/jongyeon/thunder-sft/s1/qwenwithreason8192.yaml
# configure node count
srun -N 4 bash /home/n3/jongyeon/thunder-sft/s1/runner.sh $config_path