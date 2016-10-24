#!/usr/bin/env python3

from Bio import SeqIO
from Bio.SeqIO.QualityIO import PairedFastaQualIterator
import sys

def convert(fasta_file, qual_file, fastq_file):
    """
    Combine fasta_file and qual_file into fastq_file in PHRED33 qual format.
    """
    SeqIO.write(
        (record for record in PairedFastaQualIterator(fasta_file, qual_file)),
        fastq_file,
        "fastq"
    )


if __name__ == "__main__":

    if len(sys.argv) != 3:
        sys.exit("ERROR! Provide a fasta and a qual file. Output will be spitted through stdout")

    fasta = open(sys.argv[1], "r")
    qual  = open(sys.argv[2], "r")
    fastq = sys.stdout

    convert(fasta, qual, fastq)
