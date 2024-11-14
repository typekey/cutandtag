module load singularity
BASEPATH=/project/mengjiechen/leizheng/workspace/asxl1_lj/cutandtag
# WORKDIR=$BASEPATH/work_spikein
# OUTDIR=$BASEPATH/results_spikein
WORKDIR=./work_spikein
OUTDIR=./results_spikein
DATAPATH=$BASEPATH/data/data.csv
FASTA=/project/mengjiechen/leizheng/references/human/gencode/GRCh38.primary_assembly.genome.fa
GTF=/project/mengjiechen/leizheng/references/human/gencode/gencode.v45.annotation.gtf
Blacklist=/project/mengjiechen/leizheng/references/human/encode/hg38-blacklist.bed
Spikein_fasta="/project/mengjiechen/leizheng/references/Drosophila_melanogaster/ensembl/Drosophila_melanogaster.BDGP6.46.dna.toplevel.fa"
Spikein_index="/project/mengjiechen/leizheng/references/Drosophila_melanogaster/ensembl/bowtie2/genome"
current_datetime=$(date "+%Y%m%d%H%M%S")
LOGPATH=$BASEPATH/log

# nextflow clean -f
nextflow -log $LOGPATH/${current_datetime}.log \
        run main.nf \
        --outdir $OUTDIR \
        -work-dir $WORKDIR \
        --input $DATAPATH \
        --macs_gsize 2913022398 \
        --read_length 150 \
        --blacklist $Blacklist \
        --spikein_fasta $Spikein_fasta \
        --save_reference \
        --use_control 'false' \
        --fasta $FASTA \
        --gtf $GTF \
        -profile singularity \
        -resume \
	# -bg

