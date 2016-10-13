shell.prefix("set -euo pipefail;")
configfile: "config.yaml"


snakefiles = "scripts/snakefiles/"

include: snakefiles + "folders"
include: snakefiles + "clean"
include: snakefiles + "raw"
include: snakefiles + "qc"
include: snakefiles + "assembly"
include: snakefiles + "report"

rule all:
    """
    Run the entire pipeline:
        - Linking of files
        - Base calling with pyrobayes
        - Trimming with snowhite
        - Assembly with gsAssembler
        - Quality reports with fastqc and multiqc
    """
    input:
        expand(
            report_dir + "multiqc_{sample}.html",
            sample = config["samples"]
        ),
        report_dir + "multiqc.html",
        assembly_dir + "454Isotigs.fna",
        assembly_dir + "454Isotigs.faa"
