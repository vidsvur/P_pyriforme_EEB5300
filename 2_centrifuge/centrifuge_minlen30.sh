#!/bin/bash
#SBATCH --job-name=centrifuge_ppyriforme_all
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 18
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=40G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load centrifuge/1.0.4-beta

workingdir=/projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/
indexdir=/projects/EBP/Wegrzyn/Moss/ppyriforme/initial_analysis/centrifuge_14813/centrifuge_analysis/1_index/

centrifuge --un $workingdir/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/unclassified_qc_check.fastq --mm --min-hitlen 30 --report-file $workingdir/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/centrifuge_abvf_30.tsv -p 12 -x $indexdir/abv/index/abv -x $indexdir/fungi/fungi  -U $workingdir/data/2020NOV11_Goffinet_3798A_PAG01750/fastq_pass/PAG01750_pass_2e5a7426_all.fastq
