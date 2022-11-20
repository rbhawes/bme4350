#This code builds a Bowtie2 index from human cDNA and DNA FASTA files
#This took >90 min to run. Best to call individually and run separate sbatch for each build.

#! /bin/bash
#SBATCH -A bme4350
#SBATCH -p standard
#SBATCH -c 4
#SBATCH -t 24:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=rbh2equ@virginia.edu

module load gcc/7.1.0 gcc/9.2.0 bowtie2/2.2.9

bowtie2-build -f ../genomes/human_cdna/Homo_sapiens.GRCh38.cdna.all.fa human_cdna
bowtie2-build -f ../genomes/human_dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa human_dna
