#!/bin/bash
#SBATCH --job-name=flye_2.8_AdditionalPolish
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=250G
#SBATCH --mail-user=
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

#Module load software and relevant version
module load flye/2.8.3

#This is the flye command
  # --nano-raw <input file>
  # --out-dir <path to where the output would be generated>
  # --polish-target extra polishing step (flye has an inbuilt polishing algorithm), this is optional, and was the output of this step was not used in the comparison of results in this project
  # -i iterations of polishing
  # --threads number of threads
  # --genome-size <estimated genome size>
flye --nano-raw /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq --out-dir flye_2.8_additionalPolish --polish-target --i 1 --threads 20 --genome-size 550m 
