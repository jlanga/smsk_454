shell.prefix("set -euo pipefail;")
configfile: "config.yaml"


SAMPLES_SFF = config["samples_sff"] if config["samples_sff"] is not None else []
SAMPLES_FASTQ = config["samples_fastq"] if config["samples_fastq"] is not None else []

SAMPLES = [x for x in SAMPLES_SFF] + [x for x in SAMPLES_FASTQ]

snakefiles = "bin/snakefiles/"

include: snakefiles + "folders"
include: snakefiles + "clean"
include: snakefiles + "generic"
include: snakefiles + "raw"
include: snakefiles + "qc_sff"
include: snakefiles + "qc_fastq"
include: snakefiles + "assembly"
include: snakefiles + "report"



rule all:
    """
    Run the entire pipeline:
        - Linking of files
        - Base calling with pyrobayes (for SFF files)
        - Trimming with snowhite
        - Assembly with gsAssembler
        - Quality reports with fastqc and multiqc
    """
    input:
        expand(
            report_dir + "multiqc_from_sff_{sample}.html",
            sample = SAMPLES_SFF
        ),
        expand(
            report_dir + "multiqc_from_fastq_{sample}.html",
            sample = SAMPLES_FASTQ
        ),
        report_dir + "multiqc_raw.html",
        [report_dir + "multiqc_pyrobayes.html" if len(SAMPLES_SFF) > 0 else []],
        report_dir + "multiqc_snowhite.html",
        report_dir + "multiqc_trimmomatic.html",
        report_dir + "multiqc.html",
        assembly_dir + "454Isotigs.fna",
        assembly_dir + "454Isotigs.faa",
        # expand(
        #     qc_dir + "{sample}.from_sff.snowhite.fq.gz",
        #     sample = SAMPLES_SFF
        # ),
        # expand(
        #     qc_dir + "{sample}.from_fastq.snowhite.fq.gz",
        #     sample = SAMPLES_FASTQ
        # )
