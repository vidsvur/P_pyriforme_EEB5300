#!/bin/bash
#SBATCH --job-name=nanoplot
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH -o nanoplot_%j.out
#SBATCH -e nanoplot_%j.err

#module load the relevant version of Nanoplot
module load NanoPlot/1.21.0

#Command for Nanoplot, 
  # -t (number of cores) is 8
  # --minlength (minimum read length to analyse) is 50bp
  # --fastq <input data>
#The files would be created in the same directory as the script
NanoPlot -t 8  --minlength 50 --fastq /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/data/2020NOV11_Goffinet_3798A_PAG01750/fastq_pass/*.fastq
