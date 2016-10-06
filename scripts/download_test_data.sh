#!/usr/bin/env bash

set -euo pipefail

mkdir -p data/sff/

wget \
    --continue \
    --output-document data/sff/her_b34.sff \
    ftp://ftp.sra.ebi.ac.uk/vol1/ERA088/ERA088955/sff/her_b34.sff

wget \
    --continue \
    --output-document data/sff/her_b64.sff \
    ftp://ftp.sra.ebi.ac.uk/vol1/ERA088/ERA088955/sff/her_b64.sff
