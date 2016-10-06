shell.prefix("set -euo pipefail;")
configfile: "config.yaml"


snakefiles = "scripts/snakefiles/"

include: snakefiles + "folders"
include: snakefiles + "clean"
include: snakefiles + "raw"
include: snakefiles + "qc"
include: snakefiles + "assembly"

rule all:
    input:
        fna = assembly_dir + "454Isotigs.fna",
        faa = assembly_dir + "454Isotigs.faa"
