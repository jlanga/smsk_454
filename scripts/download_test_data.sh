#!/usr/bin/env bash

set -euo pipefail

mkdir -p data/reads/

# sff
wget \
    --continue \
    --output-document data/reads/222_FZUWXHW09.sff \
    ftp://ftp.sra.ebi.ac.uk/vol1/ERA061/ERA061781/sff/222_FZUWXHW09.sff



wget \
    --continue \
    --output-document data/reads/221_FZUWXHW01.sff \
    ftp://ftp.sra.ebi.ac.uk/vol1/ERA061/ERA061781/sff/221_FZUWXHW01.sff


# fastq
wget \
    --continue \
    --output-document data/reads/ERR047535.fastq.gz \
    ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR047/ERR047535/ERR047535.fastq.gz



wget \
    --continue \
    --output-document data/reads/ERR047541.fastq.gz \
    ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR047/ERR047541/ERR047541.fastq.gz
