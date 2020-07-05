message("Started")

#
# Manage script inputs
#
ip_file <- snakemake@output[[1]]

#
# Manage R packages
#
renv::restore()
library(sessioninfo)

#
# Main script
#
ip <- installed.packages()
ip <- as.data.frame(ip)
columns_keep <- c("Package", "Version", "Priority", "License", "License_is_FOSS",  "License_restricts_use", "OS_type", "MD5sum", "NeedsCompilation",  "Built")
ip <- ip[, columns_keep]
write.table(x = ip, file = ip_file, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

message("Completed")
