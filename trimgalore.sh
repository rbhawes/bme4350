#This code runs trimgalore on raw files to remove illumina adapters and reads less than 20 bp or with quality score less than 20

#! /bin/bash
#SBATCH -A bme4350
#SBATCH -p standard
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH -c 16
#SBATCH -t 8:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=rbh2equ@virginia.edu

R1_FILES=($(ls -1 ../raw/*1.fastq))
R2_FILES=($(ls -1 ../raw/*2.fastq))

R1_FILE=${R1_FILES[$SLURM_ARRAY_TASK_ID]}
R2_FILE=${R2_FILES[$SLURM_ARRAY_TASK_ID]}

echo $R1_FILE
echo $R2_FILE

module purge
module load trimgalore

trim_galore --paired --cores 4 --quality 20 --illumina --length 20 --fastqc_args "--outdir ./trimmed_fastqc" $R1_FILE $R2_FILE
