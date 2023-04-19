#!/bin/bash
#SBATCH -A ic_engin296ma
#SBATCH --export=ALL
#SBATCH -p savio2_htc
#SBATCH -t 60
#SBATCH --cpus-per-task=1

#SBATCH --job-name="feat_shortlist"
#SBATCH --output="./feat_shortlist.out"
#SBATCH --error="./feat_shortlist.out"

echo $3
cd $3
date
$1 $2/featurize_shortlist.py $4
