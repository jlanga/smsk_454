#/usr/bin/env python3

from Bio import SeqIO
import sys

def fastq_to_fasta(fastq, fasta):
    SeqIO.write([record for record in SeqIO.parse(handle = fastq, format = "fastq")], fasta, "fasta")
    

if __name__ == "__main__":
    
    if len(sys.argv) != 1:
        sys.exit("ERROR! Pipe me a fastq! Fasta will come out through stdout")
    
    fastq_to_fasta(sys.stdin, sys.stdout)

