# An example collection of Snakemake rules imported in the main Snakefile.

rule installed_packages:
    output:
        "results/tables/installed_packages.txt"
    conda:
        "../envs/r.yaml"
    script:
        "../scripts/installed_packages.R"


rule session_info:
    output:
        "results/tables/session_info.txt"
    conda:
        "../envs/r.yaml"
    script:
        "../scripts/session_info.R"


rule renv:
    output:
        "renv/activate.R"
    conda:
        "../envs/r.yaml"
    script:
        "../scripts/renv.R"
