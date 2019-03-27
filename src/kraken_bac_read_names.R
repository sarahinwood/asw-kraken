#!/usr/bin/env Rscript

#######
# LOG #
#######

log <- file(snakemake@log[[1]], open = "wt")
sink(log, type = "message")
sink(log, append = TRUE, type = "output")

#############
# LIBRARIES #
#############

library(data.table)

###########
# GLOBALS #
###########

kraken_bac_res <- snakemake@input[["kraken_bac_res"]]

########
# MAIN #
########

kraken_bac_res <- fread(kraken_bac_res, header = FALSE)
bac_read_names <- kraken_bac_res[c(2)]
fwrite(bac_read_names, quote=FALSE, col.names = FALSE, snakemake@output[["bac_read_names"]])

#write log
sessionInfo()






