library(here)
library(rmarkdown)
library(fs)
library(tidyverse)
library(future)
library(furrr)


# 1-species-level models ---------------------------------------------------
species_files <- dir_ls(here("02_analyses",
                             "01_species_modelling"), recurse = T,
                        regexp = "\\.Rmd$")

plan(multisession, workers = 6)

future_map(species_files, \(x) render(x))


# 2-figures ---------------------------------------------------------------
render(here("02_analyses", "02_figures",
            "fig1_clim_niche.Rmd"), "github_document")

render(here("02_analyses", "02_figures",
            "fig2_dens_ba_stand.Rmd"), "github_document")

render(here("02_analyses", "02_figures",
            "fig3_clim_stand.Rmd"), "github_document")

render(here("02_analyses", "02_figures", 
            "fig4_clim_sensi.Rmd"), "github_document")



