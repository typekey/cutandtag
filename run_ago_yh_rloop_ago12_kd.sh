module load singularity
BASEPATH=/scratch/midway3/leizheng/workspace/ago_yh/cutandtag
# WORKDIR=$BASEPATH/work_spikein
# OUTDIR=$BASEPATH/results_spikein
WORKDIR=$BASEPATH/work_rloop_ago12_kd
OUTDIR=$BASEPATH/results_rloop_ago12_kd
DATAPATH=$BASEPATH/data_rloop_ago12_kd.csv
FASTA=/project/mengjiechen/leizheng/references/Homo_sapiens/GENCODE/GRCh38/sequence/genome/GRCh38.genome.fa
GTF=/project/mengjiechen/leizheng/references/Homo_sapiens/GENCODE/GRCh38/annotation/gencode.v44.annotation.gtf
# genome_index=/project/mengjiechen/leizheng/references/Homo_sapiens/GENCODE/GRCh38/sequence/genome/bowtie2/genome
Blacklist=/project/mengjiechen/leizheng/references/Homo_sapiens/ENCODE/hg38-blacklist.bed
Spikein_fasta="/project/mengjiechen/leizheng/references/Drosophila_melanogaster/ensembl/Drosophila_melanogaster.BDGP6.46.dna.toplevel.fa"
Spikein_index="/project/mengjiechen/leizheng/references/Drosophila_melanogaster/ensembl/bowtie2"
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
        --spikein_bowtie2 $Spikein_index \
        --save_reference \
        --use_control 'false' \
        --fasta $FASTA \
        --gtf $GTF \
        -profile singularity \
        -resume \
	# -bg

