#!/bin/bash
#SBATCH -D /global/home/users/amandapaulson/data
#SBATCH -A ic_engin296ma
#SBATCH --export=ALL
#SBATCH -p savio2_htc
#SBATCH -t 60
#SBATCH --cpus-per-task=1
#SBATCH --job-name="feat_add_valid"
#SBATCH --output="/global/home/users/amandapaulson/data/featurize_datasets_shortlist/feat_add_valid.out"
#SBATCH --error="/global/home/users/amandapaulson/data/featurize_datasets_shortlist/feat_add_valid.out"

date
python ./featurize_shortlist.py $1
