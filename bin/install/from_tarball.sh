#!/usr/bin/env bash

set -euo pipefail # Unoficial bash strict modern

mkdir -p src/
pushd src/

# wget \
#     --output-document seqclean-x86_64.tgz \
#     --continue \
#     http://downloads.sourceforge.net/project/seqclean/seqclean-x86_64.tgz
# tar xvf seqclean-x86_64.tgz
# popd

# SnoWhite

wget \
    --output-document SnoWhite_2.0.3_release.tar.gz \
    --continue \
    http://dlugoschlab.arizona.edu/software/SnoWhite_2.0.3_release.tar.gz

tar \
    --extract \
    --verbose \
    --file SnoWhite_2.0.3_release.tar.gz

wget \
    --output-document MAXIMUSv0.2.zip \
    --continue \
    http://downloads.sourceforge.net/project/maximuspipeline/MAXIMUSv0.2.zip

unzip MAXIMUSv0.2.zip third_party/PyroBayes
cp third_party/PyroBayes ../bin/
chmod +x ../bin/PyroBayes

popd
