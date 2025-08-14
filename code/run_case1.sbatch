#!/bin/bash
#SBATCH --job-name=madingley_case1
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --output=%x-%j.out
#SBATCH --account=def-dgravel   # Replace with your allocation

#export PROJECT=$HOME/links/projects/def-your_account/$USER  # Replace with your project path

module load StdEnv/2023
module load r gdal

Rscript "$HOME/madingley/code/case1.R"