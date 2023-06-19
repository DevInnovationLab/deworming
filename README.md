# Data and Code for "Meta-Analysis and Public Policy: Reconciling the Evidence on Deworming"

The code in this replication package recreates the main data set and results in the paper using R and Stata. To replicate outputs, run `main.do`. The replicator should expect the code to run in less than 20 minutes.

## Data Availability and Provenance Statements

The raw data used in the paper can be found in `data/raw`. The two main raw datasets are `mda.dta`, containing data from MDA trials and created by script 01, and `tt.dta`, contaning data from test-and-treat trials and created by script 02. The data from the Campbell Systematic Reviews was provided by the authors of that study. 

**The data is licensed under a CC BY 4.0 license. See [LICENSE.txt](LICENSE.txt) for details.**

## Computational requirements

The code was last run on a **10-core Intel-based laptop with Windows 10 and 16GB RAM**. The entire code ran in less than 20 minutes.

### Software Requirements

- **Stata** code was last run with version 17. The following community-contributed packages are installed in lines (21-35 of `main.do`):
  - `estout` (version 3.31  26apr2022)
  - `ietoolkit` (version 7.2 04APR2023)
  - `metan` (version 4.06  12oct2022)
  - `metareg` (v2.6.1 4Nov2008)
  - `rsource` (Date: 27 February 2014)
- **R** code was last run with version 4.2.3. The exact versions of all packages last used are listed in `renv.lock`. To install these versions, launch the R project `deworming.RProj` and run `renv::restore()`.

### Controlled Randomness

Script `07_bayesian hierarchical models.R` runs simulations and a random seed is set at line 89.

## Description of programs/code

All scripts used for data creation and analysis are included in `code`. Scripts 01-03 create or import the raw data in `data/raw`. Scripts 04 and 05 reformat the raw data for use with different functions. Scripts 06-11 analyze the data. See `main.do` for a detailed description of inputs and outputs of each script.

**The code is licensed under an Unlicense license. See [LICENSE.txt](LICENSE.txt) for details.**

## Instructions to Replicators

- Edit line 11 in `main.do` to adjust the file path to the root directory of this repository
- Edit line 33 in `main.do` to adjust the file path to the R installation in your computer
- Run `main.do` to run all steps in sequence.
- The Excel file `output/Formatted tables.xlsx` reads the csv files exported by the code and formats them as in the paper. It also adds some simple calculations as indicated in the `Notes` column of the table below.

## List of tables and programs

The provided code reproduces all tables and figures in the paper, except for the items marked under "Note" below.

| Figure/Table #    | Program                        | Line Number | Output file                      | Note                            |
|-------------------|--------------------------------|-------------|----------------------------------|---------------------------------|
| Table 1           | `code/10_metan.do`             | 2           | output/tables/table1.csv   ||
| Table 2           | `code/10_metan.do`             | 47          | output/tables/table2.csv         ||
| Table 3           | `code/10_metan.do`             | 125         | output/tables/table3.csv         | Columns 7-12? |
| Figure 1          | `code/06_forest_plots.R`       |             | output/figures/figure1.png       ||
| Figure 2          | `code/06_forest_plots.R`       |             | output/figures/figure2.png       ||
| Figure 3          | `code/06_forest_plots.R`       |             | output/figures/figure3.png       ||
| Figure 4          | `code/06_forest_plots.R`       |             | output/figures/figure4.png       ||
| Figure 5          | `code/11_roodman_graph.R`      |             | output/figures/metaforest--.png  ||
| Table S2          | `code/10_metan.do`             | 165         | output/tables/tableS2.csv        | Calculations for panel C are done directly in Excel |
| Table S3          | `code/10_metan.do`             | 288         | output/tables/tableS3.csv        ||
| Table S4          | `code/10_metan.do`             | 320         | output/tables/tableS4.csv        ||
| Table S5          | `code/10_metan.do`             | 365         | output/tables/tableS5.csv        ||
| Table S6          | `code/10_metan.do`             | 400         | output/tables/tableS6.csv        ||
| Table S7          | | | | This table is created in Excel using values from tables 2 and 3 doing additional calculations.  |
| Table S8          | `code/08_clean_stan_output.do` |             | output/tables/tableS8.csv        ||
| Table F1          | `code/09_publication_bias.R`   | 75          | output/tables/tableF1.png        | Panels B and C were created by inputing the data in `data/pub_bias` into [this app](https://maxkasy.github.io/home/metastudy/) |
| Table F2          | `code/09_publication_bias.R`   | 75          | output/tables/tableF1.png        | Panels B and C were created by inputing the data in `data/pub_bias` into [this app](https://maxkasy.github.io/home/metastudy/) |
| Figure F1         | `code/09_publication_bias.R`   | 48          | output/figures/figureF1.png      ||
