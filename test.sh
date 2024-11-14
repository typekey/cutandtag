module load singularity
nextflow main.nf --outdir results -profile test,singularity
