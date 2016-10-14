# smsk: A Snakemake skeleton to jumpstart projects

<!--[![Build Status](https://travis-ci.org/jlanga/smsk_454.svg?branch=master)](https://travis-ci.org/jlanga/smsk_454)-->

## 1. Description

This is a workflow to assemble RNA reads from 454 into a transcriptome. The procedure is as follows:

1. Quality control

    1. Base calling with `PyroBayes` (if `.sff` files are provided)
    2. Quality, length and adaptor trimming with `SnoWhite`

2. Assembly

    With `gsAssembler` from Roche's Data Analysis tools (`newbler`)

## 2. First steps

1. Clone the repo

    ```sh
    git clone https://github.com/jlanga/smsk_454.git # Clone
    cd smsk_454
    ```

2. Activate the environment (`deactivate` to deactivate):
    ```sh
    source bin/activate
    ```

3. Install software and packages via pip and homebrew (edit whatever is necessary):

    ```sh
    bash bin/install/brew.sh
    bash bin/install/from_brew.sh
    bash bin/install/from_pip3.sh
    bash bin/install/from_tarball.sh
    ```

4. Additional requirements

    Pyrobayes is an accurate base caller for 454 datasets. It used to be available through free registration at [here](http://bioinformatics.bc.edu/marthlab/PyroBayes). It used to be a file called `pyrobayes.unified_release_64bit.tar.gz`. If you are able to get it, do the following

    ```sh
    mkdir -p src/
    pushd src/
    cp /path/to/tarball.tar.gz .
    tar xvf pyrobayes.unified_release_64bit.tar.gz
    popd
    cp src/UnifiedRelease/bin/PyroBayes bin/
    ```

    The same applies to get `gsAssembler`. You should go to [Roche](http://454.com/contact-us/software-request.asp) and ask for a copy (it is free but requires registration). You should get a file called `DataAnalysis_2.9_All_20130530_1559.tgz`. If you are connecting through ssh, use the `-X` option to allow graphic interfaces (`ssh server -X`).

    From here,

    ```sh
    mkdir -p src/
    pushd src/
    cp /path/to/DataAnalysis_2.9_All_20130530_1559.tgz .
    tar xvf DataAnalysis_2.9_All_20130530_1559.tgz
    pushd DataAnalysis_2.9_All/
    bash setup.sh
    ```

    And a window will pop up. Select "local installation" and choose as installation path the `src/` directory of this project (in my case `/home/jlanga/pipelines/smsk_454/src/454/`)


4. Download sample data from the European Nucleotide Archive (ENA;  two sff files and two fastq files):

    ```sh
    bash bin/download_test_data.sh
    ```

5. Execute the pipeline (should take up to 10 minutes):

    ```sh
    snakemake -j 24
    ```



## 3. File organization

The hierarchy of the folder is the one described in [A Quick Guide to Organizing Computational Biology Projects](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424):

```
smsk
├── .linuxbrew: brew files
├── bin: scripts,binaries and snakemeake related files.
├── data: raw data, hopefully links to backuped data.
├── doc: logs.
├── README.md
├── results: processed data, reports, etc.
└── src: additional source code, tarballs, etc.
```


## Bibliography and resources

- [A Quick Guide to Organizing Computational Biology Projects](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)

- [Snakemake—a scalable bioinformatics workflow engine](http://bioinformatics.oxfordjournals.org/content/28/19/2520)

- [Seqclean](https://sourceforge.net/projects/seqclean/files/)

- [Fastqc](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

- [Snowhite](http://evopipes.net/snowhite.html)

- [Tagdust](http://tagdust.sourceforge.net/)

- [PyroBayes](Pyrobayes: an improved base caller for SNP discovery in pyrosequences)

- [Linuxbrew](http://linuxbrew.sh/)
