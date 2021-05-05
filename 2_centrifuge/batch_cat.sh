#!/bin/bash
#SBATCH --job-name=centrifuge_cat
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH -o centrifuge_cat_%j.out
#SBATCH -e centrifuge_cat_%j.err

##concatenating all the .fna files to one file- input-sequences.fna file

cat /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/fungi/plant_files/*.fna > plants/input-sequences.fna
