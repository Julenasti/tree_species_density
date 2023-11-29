library(here)
library(rmarkdown)
library(tidyverse)
library(furrr)
library(future)


# 1-species-level models ---------------------------------------------------
data_model <- readRDS(file = here("01_data", "data_model.rds"))

sp_vector <- unique(data_model$species.cor)

render_sp_models <- function(species.cor) {
  render(
    input = here(
      "02_analyses",
      "01_species_modelling",
      "input_sp_modelling.Rmd"
    ),
    output_file = paste0(
      here("02_analyses", "01_species_modelling"),
      "/",
      species.cor,
      ".md"
    ),
    params = list(species.cor = species.cor),
    envir = parent.frame()
  )
}

plan(multisession, workers = 6)

future_walk(sp_vector[c(61:73)], \(x) render_sp_models(x))


# 2-figures ---------------------------------------------------------------
render(here("02_analyses", "02_figures",
            "fig1_clim_niche.Rmd"), "github_document")

render(here("02_analyses", "02_figures",
            "fig2_dens_ba_stand.Rmd"), "github_document")

render(here("02_analyses", "02_figures",
            "fig3_clim_stand.Rmd"), "github_document")

render(here("02_analyses", "02_figures", 
            "fig4_clim_sensi.Rmd"), "github_document")



