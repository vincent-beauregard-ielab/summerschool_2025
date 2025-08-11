# 🐟 MadingleyR on Cedar – Quick Start Guide

## 1. Understand the Cedar HPC environment

Before diving in, read these to understand the system you’re on:

* [Alliance – Using Cedar](https://docs.alliancecan.ca/wiki/Cedar)
* [Alliance – Filesystem and storage (\$HOME, \$PROJECT, \$SCRATCH)](https://docs.alliancecan.ca/wiki/Storage_and_file_management)
* [Alliance – Using modules](https://docs.alliancecan.ca/wiki/Using_modules)

**Key points**:

* **Login nodes**: Where you install and prepare work.
* **Compute nodes**: Where your jobs actually run (through Slurm).
* **Shared storage**: `$HOME`, `$PROJECT`, and `$SCRATCH` are available on all nodes.


## 2. Create working folders

SSH into Cedar and run:

Set up your project directory structure on Cedar.
```bash
# export PROJECT=def-your_account  # Replace with your project allocation
ls $HOME/links/projects # Check links to your projects allocation
export ACCOUNT=def-your_account  # Replace with your project allocation
export PROJECT=$HOME/links/projects/def-your_account/$USER  # Replace with desired project path in your project allocation
```

```bash
mkdir -p $PROJECT/madingley/{code,r-lib}
mkdir -p $SCRATCH/madingley_out
```

* **\$PROJECT** → for R packages & code (shared, persistent)
* **\$SCRATCH** → for simulation output (large files, temporary)


## 3. Load R and dependencies

Modules are how you load software on Cedar.

Check what’s available:

```bash
module spider r
module spider gdal proj geos
```

Then load them (adjust version if newer):

```bash
module load StdEnv/2023
module load r/4.5.0
module load gdal proj geos
```

📖 [Alliance – Using modules](https://docs.alliancecan.ca/wiki/Using_modules)


## 4. Tell R where to install your packages

Set the R library path to your `$HOME$` space so jobs can find them:

```bash
echo 'R_LIBS_USER="'"$PROJECT/madingley/r-lib"'"' >> ~/.Renviron
```


## 5. Install MadingleyR

Do this **on the login node** (internet is blocked on compute nodes):

```bash
R
```

In the R console:

```r
install.packages(c("remotes","data.table","terra","sf"))
library(remotes)
install_github("MadingleyR/MadingleyR", subdir="Package", build_vignettes=FALSE)
library(MadingleyR)
madingley_version()
q()
```


## 6. Create your first simulation script

Save this as:
`$PROJECT/madingley/code/case1.R`

```r
library(MadingleyR)

# Region of interest
spatial_window <- c(31, 35, -5, -1)

out_dir <- file.path(Sys.getenv("SCRATCH"), "madingley_out")
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

mdata <- madingley_init(spatial_window = spatial_window)
mdata2 <- madingley_run(out_dir = out_dir, madingley_data = mdata, years = 10)

saveRDS(mdata2, file.path(out_dir, "case1_results.rds"))
```


## 7. Create a Slurm batch script

📖 [Alliance – Running jobs with Slurm](https://docs.alliancecan.ca/wiki/Running_jobs)

Save this as:
`$PROJECT/madingley/code/run_case1.sbatch`

```bash
#!/bin/bash
#SBATCH --job-name=madingley_case1
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --output=%x-%j.out
#SBATCH --account=def-ACCOUNT   # Replace with your allocation

module load StdEnv/2023
module load r/4.4.1
module load gdal proj geos

Rscript "$PROJECT/madingley/code/case1.R"
```


## 8. Submit your job

From Cedar login node:

```bash
cd $PROJECT/madingley/code
sbatch run_case1.sbatch
```

Check job status:

```bash
squeue -u $USER
```


## 9. Retrieve your results

When the job is finished:

```bash
ls $SCRATCH/madingley_out
```

You should see:

* `case1_results.rds` → the simulation output
* Any additional plots or data files


## 10. Troubleshooting

* If R can’t find `terra` or `sf`: make sure you loaded `gdal`, `proj`, `geos` **both when installing and in the job script**.
* If you see “no internet” errors: remember to install packages on the **login node**, not inside jobs.
