#!/usr/bin/env python3

from Bio import SeqIO
from Bio.SeqIO.QualityIO import PairedFastaQualIterator
import sys

def convert(fasta, qual, fastq):
    SeqIO.write(
        (record for record in PairedFastaQualIterator(fasta, qual)),
        fastq,
        "fastq"
    )


if __name__ == "__main__":

    if len(sys.argv) != 3:
        sys.exit("ERROR! Provide a fasta and a qual file. Output will be spitted through stdout")

    fasta = open(sys.argv[1], "r")
    qual  = open(sys.argv[2], "r")
    fastq = sys.stdout

    convert(fasta, qual, fastq)
