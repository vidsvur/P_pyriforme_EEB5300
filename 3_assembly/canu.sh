#!/bin/bash
#SBATCH --job-name=canu
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=250G
#SBATCH --partition=himem
#SBATCH --qos=himem
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kristin.b.anderson@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err
hostname
date
##########################################################
##                canu assembly                         ##
##########################################################
module load perl/5.28.1
module load canu/2.1.1
canu -p moss -d canu-trial2 maxThreads=12 genomeSize=500m useGrid=false corOutCoverage=500 "batOptions= -dg 3 -db 3 -dr 1 -ca 500 -cp 50" -nanopore /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq
