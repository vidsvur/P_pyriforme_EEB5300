#!/bin/bash
#SBATCH --job-name=quast_flye
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=20G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.out

#load quast and its version
module load quast/5.0.2

#the quast command
  # add the input file to be assessed
  # -o the output directory
quast.py ~/redbean4/wtdbg2/dbg.cns.fa  -o quast_comparison5  
