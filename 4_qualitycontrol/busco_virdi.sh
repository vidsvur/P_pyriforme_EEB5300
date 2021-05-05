#!/bin/bash
#SBATCH --job-name=buscoi_flye.2.4.2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=5G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

#load relavant software and versions
#busco v4.1.2 uses augustus, and we linked a local copy of augustus in this script
module load busco/4.1.2
export AUGUSTUS_CONFIG_PATH=$HOME/Augustus/config/

#this is the busco command
  # -i <input file>
  # -l <database>
  # -o <name of output dir>
  # -m this is the "mode", and we used the genome mode
  # -f forces an overwrite, so it removes an earlier dir with the name "Moss_viridi" if present
busco -i ../assembly.fasta -l viridiplantae_odb10 -o Moss_viridi -m genome -f

