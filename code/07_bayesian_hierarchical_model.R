# Load libraries ---------------------------------------------------------------

# The below packages facilitate importing and data manipulation
library(knitr)
library(tidyverse)
library(coda)
library(ggmcmc)
library(metafor)

# Load packages for Stan
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

# Inputs -----------------------------------------------------------------------

data <-
  read_csv("data/main/mda_tt_long.csv") %>%
  filter(group == "mda")

outcomes <- c("weight (kg)", "height (cm)", "Haemoglobin (g/dL)", "mid-upper arm circumference (cm)")
model_names <- c("5a_halfnormal_uni", "6a_skewnormal_uni")


# Run simulations for all outcomes and models ----------------------------------

for (out in outcomes) {
  for (model_name in model_names) {

    print(
      paste(
        "We're now doing model",
        model_name,
        "for outcome",
        out
      )
    )

## Prepare data ----------------------------------------------------------------

    outcome_data <-
      data %>%
      filter(outcome == out)

    studydata <-
      list(
        J = nrow(outcome_data),
        y = outcome_data$mean_diff,
        sigma = outcome_data$se_mean_diff
      )

## Set parameters for the optimization routine ---------------------------------

    if (grepl("skewnorm", model_name)) {
      this_adapt_delta <- 0.99999
      this_tree_depth <- 10
      this_init_r <- 2
      this_stepsize <- 0.1
      this_init <- "random"
      chains <- 12
      iter <- 10000
    } else {
      this_adapt_delta <- 0.9
      this_tree_depth <- 10
      this_init_r <- 2
      this_stepsize <- 0.05
      this_init <- "random"
      chains <- 12
      iter <- 10000
    }

## Set filename to use for outputs of this model -------------------------------

    filename <-
      out %>%
      str_replace_all("/", " per ") %>%
      paste0("output/stan/", ., " - ", model_name)

## Run simulation --------------------------------------------------------------

    fit <-
      stan(
        file = paste0('code/stan/', model_name, '.stan'),
        data = studydata,
        iter = iter,
        chains = chains,
        init = this_init,
        init_r = this_init_r,
        seed = 25849600,
        sample_file = paste0(filename, " - draws.csv"),
        save_dso = FALSE,
        save_warmup = FALSE
      )

## Get statistics on posteriors ------------------------------------------------

    draws <- as.data.frame(fit)

    allstats <-
      data.frame(
        "statname" = names(draws),
        "mean" = sapply(draws, mean),
        "sd" = sapply(draws, sd),
        "X2.5." = sapply(draws, quantile, probs = c(0.025)),
        "X25." = sapply(draws, quantile, probs = c(0.25)),
        "X50." = sapply(draws, quantile, probs = c(0.5)),
        "X75." = sapply(draws, quantile, probs = c(0.75)),
        "X97.5" = sapply(draws, quantile, probs = c(0.975)),
        "den_below_zero" = sapply(draws, function(x) sum(x < 0, na.rm = TRUE)/length(x)),
        "mean_conditional_on_neg" = sapply(draws, function(x) mean(x[x < 0])),
        "mean_conditional_on_pos" = sapply(draws, function(x) mean(x[x > 0]))
      )


## Save stats on posterior distributions ---------------------------------------
    write_csv(
      allstats,
      paste0(filename, " - allstats.csv"),
      append = FALSE
    )

  }
}
