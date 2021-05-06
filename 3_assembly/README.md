# Comparison of Assemblers 

**Path to assembly scripts:** /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly
## Redbean/wtdbg2
Link to [redbean/wtdbg2 github manual](https://github.com/adigenova/wengan).

The redbean pipeline is a de novo assembler for noisy long reads. Redbean is a newer assembler with a number of benefits for long read assembly. It functions without prior error correction. It’s especially useful for nanopore assembly because it utilizes short kmers to account for the fact that nanopore data is more error prone and has lower coverage. 
The result is that paralogous regions are better resolved, but it results in a more fragmented assembly. It’s also a faster assembler. Our assembly with redbean took 16 hours, whereas flye took 1-2 days, and canu has been running for 11+ days.

## Wengan
Link to [wengan github manual](https://github.com/adigenova/wengan).

Wengan is a hybrid assembler, requiring inputs from both short and long reads. The script ultimately failed because we only have long reads at this time. We might utilize this script in the future after we have access to short reads for analysis. 

## Miniasm
Link to [miniasm github manual](https://github.com/lh3/miniasm).

Miniasm was designed to assemble noisy longreads. We attempted several iterations of adjusting flags with this assembly script, but ultimately the script failed because the miniasm assembly pipeline is currently experiencing software bugs. The 1st and 2nd miniasm.sh scripts failed due to incorrect flags. The 3rd script failed at step 5 when attempting to generate unitigs. In light of the known software bugs associated with miniasm, we decided to give miniasm the boot & cancel the 4th script job in order to free up memory to run the canu assembly pipeline. 

## Canu
Link to [canu quickstart manual](https://canu.readthedocs.io/en/latest/quick-start.html). Link to [canu github manual](https://github.com/marbl/canu).

Canu was designed to assemble Oxford & PacBio Nanopore long reads. The canu assembly script initially failed 3 times due to incorrect flag selection, but the 4th attempt has been successful so far (still running). The flags we used included turning off the grid and setting the genome size to 500m. 
Typically, canu assemblies take ~5 days to complete, but our canu assembly pipeline has been running for 13 days, as of 5/6/21. The output files have not yet been transferred to the shared directory yet, since the assembly is still running. The three phases of the canu pipeline are correction, trimming & assembly. The output files indicate that the pipeline is currently at the “obtovl overlap” step, which began on 5/3/21. The output files are running in Kris’ directory at Path /home/FCAM/kanderson/canu/canu_trial4. The canu files will be transferred to the shared directory once the run is complete.

## Shasta
Link to [shasta github manual](https://github.com/chanzuckerberg/shasta). 

Shasta was designed for long-read Oxford reads. For this step, we used the "shasta_assembly.sh" script. The job took a little more than one day to run. Shasta produces an output folder, with "Assembly.fasta" being the output file from the assembly. 

## Flye 
Link to [flye github manual](https://github.com/fenderglass/Flye). 

Flye was also designed for Pacbio and Oxford Nanopore reads. We used the "flye_3798_all_2.8.sh" script, and this run took over 1 day to finish. Flye produces multiple output and a detailed log to track the progress of the assembly. If the run is successful, it also produces a "assembly.fasta" file. 

## Discussion

Ultimately, we had three final assemblies from shasta, flye, and redbean. In terms of processing time:

Assembly | Run times |
---| --- |
Shasta | >1 day |
Flye | 1-2 days |
Redbean | ~16 hours|

Shasta produced an assembly of around 500Mb, whereas flye and redbean assemblies produced assemblies of around 1-2Gb. We hypothesize that Shasta may have assembled a fraction of the assembly, or probably a contaminant. In comparison, flye and redbean were able to produce assemblies that were closer in size. In fact, when we ran flye by enforcing "genome size = 500 Mb", the assembler still produced an assembly of around 1 Gbp. This could be a result of the differences in algorithms between the assemblers. 
Details of quast and busco scores will be under "4_qualitycontrol".

## References
Di Genova, A., Buena-Atienza, E., Ossowski, S., & Sagot, M. F. (2020). Efficient hybrid de novo assembly of human genomes with WENGAN. Nature Biotechnology, 1-9.

Kolmogorov, M., Yuan, J., Lin, Y., & Pevzner, P. A. (2019). Assembly of long, error-prone reads using repeat graphs. Nature biotechnology, 37(5), 540-546.

Koren, S., Walenz, B. P., Berlin, K., Miller, J. R., Bergman, N. H., & Phillippy, A. M. (2017). Canu: scalable and accurate long-read assembly via adaptive k-mer weighting and repeat separation. Genome research, 27(5), 722-736.

Li, H. (2016). Minimap and miniasm: fast mapping and de novo assembly for noisy long sequences. Bioinformatics, 32(14), 2103-2110.

Ruan, J., & Li, H. (2020). Fast and accurate long-read assembly with wtdbg2. Nature methods, 17(2), 155-158.

Shafin, K., Pesout, T., Lorig-Roach, R., Haukness, M., Olsen, H. E., Bosworth, C., & Paten, B. (2020). Nanopore sequencing and the Shasta toolkit enable efficient de novo assembly of eleven human genomes. Nature biotechnology, 38(9), 1044-1053.
