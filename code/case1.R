library(MadingleyR)

# Region of interest
spatial_window <- c(31, 35, -5, -1)

out_dir <- file.path(Sys.getenv("SCRATCH"), "madingley_out")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

mdata <- madingley_init(spatial_window = spatial_window)
mdata2 <- madingley_run(out_dir = out_dir, madingley_data = mdata, years = 10)

saveRDS(mdata2, file.path(out_dir, "case1_results.rds"))