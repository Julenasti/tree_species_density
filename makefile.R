library(here)
library(rmarkdown)
library(fs)
library(tidyverse)
library(future)
library(furrr)

# 1-species-level models ---------------------------------------------------
render_sp_mod <- function(x){
  render(dir_ls(here("02_analyses",
                     "01_species_modelling"), recurse = T,
                regexp = "\\.Rmd$")[x])
}

plan(multisession, workers = 6)

future_map(1:73, ~render_sp_mod(.x), seed = NULL)


# 2-figures ---------------------------------------------------------------
render(here("02_analyses", "02_figures",
            "fig1_clim_niche.Rmd"), "github_document")

render(here("02_analyses", "02_figures",
            "fig2_clim_stand.Rmd"), "github_document")

render(here("02_analyses", "02_figures", 
            "fig3_clim_sensi.Rmd"), "github_document")



