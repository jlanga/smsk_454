#!/usr/bin/env bash

set -euo pipefail # Unoficial bash strict modern

mkdir -p src/
pushd src/
wget \
    --output-document seqclean-x86_64.tgz \
    --continue \
    http://downloads.sourceforge.net/project/seqclean/seqclean-x86_64.tgz
tar xvf seqclean-x86_64.tgz
popd
