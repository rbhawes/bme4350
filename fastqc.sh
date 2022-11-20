#This code runs FastQC on raw data files

#! /bin/bash
#SBATCH -A bme4350
#SBATCH -p standard
#SBATCH -c 4
#SBATCH -t 24:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=rbh2equ@virginia.edu

module load fastqc

SAMPLELIST=($(find ../0-raw/*.fastq | sort -u))

FILE=${SAMPLELIST[$SLURM_ARRAY_TASK_ID]}

echo $FILE
fastqc -o ./1-fastqc $FILE
