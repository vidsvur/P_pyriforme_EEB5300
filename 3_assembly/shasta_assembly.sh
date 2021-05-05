#!/bin/bash
#SBATCH --job-name=shasta_assembly
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 18
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=100G
#SBATCH --mail-user=
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

#load software and relevant version
module load shasta/0.7.0

#shasta command line
  # --memoryBacking (read "Memory modes" in shasta manual to choose the relevant option for your server
  # --threads number of cores
  # --input <input file>

shasta --memoryBacking disk --memoryMode filesystem --threads 18 --input /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/ppyriforme_all_reads.fastq 

#this is an additional step, to remove intermediary files that would take up space
shasta --command cleanupBinaryData
