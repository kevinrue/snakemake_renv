message("Started")

#
# Manage script inputs
#
si_file <- snakemake@output[[1]]

#
# Manage R packages
#
renv::restore()
library(sessioninfo)

#
# Main script
#
si <- sessioninfo::session_info()

columns_keep <- c('package', 'ondiskversion', 'loadedversion', 'attached', 'is_base', 'date', 'md5ok')
si_packages <- si$packages[, columns_keep]
si_packages <- as.data.frame(si_packages)

write.table(x = si_packages, file = si_file, quote = FALSE, sep = "\t", row.names = FALSE)

message("Completed")
