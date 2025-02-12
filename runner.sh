#!/bin/bash


NNODES=$SLURM_NNODES
if [ -z $NNODES ]; then
    NNODES=1
fi
NODE_RANK=$SLURM_NODEID
if [ -z $NODE_RANK ]; then
    NODE_RANK=0
fi

echo "NODELIST="$SLURM_NODELIST
master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
echo "MASTER_ADDR="$MASTER_ADDR
MASTER_ADDR=$MASTER_ADDR

if [ -z $SLURM_JOBID ]; then
    SLURM_JOBID=12345
fi

export MASTER_PORT=$(expr 10000 + $(echo -n $SLURM_JOBID | tail -c 4))
export MASTER_ADDR=$master_addr
export NNODES=$NNODES
export NODE_RANK=$NODE_RANK
export FORCE_TORCHRUN=1
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

source ${HOME}/.bashrc
#source ${HOME}/anaconda3/etc/profile.d/conda.sh
conda activate snullm
#conda activate p2
cd ${HOME}/LLaMA-Factory 

llamafactory-cli train $1