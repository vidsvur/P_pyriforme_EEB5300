#!/bin/bash
#SBATCH --job-name=centrifuge_build
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=200G
#SBATCH -o centrifuge_build_%j.out
#SBATCH -e centrifuge_build_%j.err

##Module load the relevant program and version
module load centrifuge/1.0.4-beta

##Build indices for centrifuge
	# -p number of cores
	# --conversion-table <path to seqid2taxid.map folder generated earlier>
	# --taxonomy tree <path to node.dmp file created earlier>
	# --name-table <path to names.dmp>
	# add the path to the .fna sequences created from the batch_cat.sh step
	# "plant" refers to the name of the index, you can re-name it to whatever is suitable
centrifuge-build -p 8 --conversion-table /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/plants/kraken_db_plants/seqid2taxid.map \
	--taxonomy-tree /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/plants/kraken_db_plants/taxonomy/nodes.dmp --name-table /projects/EBP/CBC/ppyriforme/centrifuge_14813/kraken/plants/kraken_db_plants/taxonomy/names.dmp \
	/projects/EBP/CBC/ppyriforme/centrifuge_14813/centrifuge_analysis/1_index/plants/input-sequences.fna plant
