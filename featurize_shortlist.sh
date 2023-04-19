#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=pbatch
#SBATCH --account=asccasc
#SBATCH --time=720
#SBATCH --export=ALL
#SBATCH --job-name="feat_add_valid"
#SBATCH --output="/usr/workspace/atom/PARP_compounds/Datasets_and_Models/featurize_datasets_shortlist/feat_add_valid.out"
#SBATCH --error="/usr/workspace/atom/PARP_compounds/Datasets_and_Models/featurize_datasets_shortlist/feat_add_valid.out"
source /g/g16/apaulson/workspace/miniconda3/envs/ampl-140/bin/activate
date
cd /usr/workspace/atom/

python ./PARP_compounds/Datasets_and_Models/featurize_datasets_shortlist/PARP_featurize_add_valid_dsets.py ./PARP_compounds/Datasets_and_Models/featurize_datasets_shortlist/PARP_shortlist_CGUAgg_2022-06.csv