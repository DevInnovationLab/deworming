library(tidyverse)
library(metafor)
library(meta)
library(xlsx)

# Inputs =======================================================================

outcomes = c(
  "weight (kg)",
  "height (cm)",
  "mid-upper arm circumference (cm)",
  "Haemoglobin"
)

trial_type <- c("MDA", "MDA_tt")


estimates <-
  function(data) {
    rma(
      yi = data$mean_diff,
      sei = data$se_mean_diff,
      method = "DL",
      slab = data$study)
  }

# Data =========================================================================
data <-
  read_csv("data/main/mda_tt_long.csv") %>%
  mutate(
    outcome = str_replace_all(outcome, " [(]g/dL[)]", "")
  )

df_mda <-
  data %>%
  filter(group == "mda")

df_tt <-
  data %>%
  filter(group == "tt")

df_infected <-
  data %>%
  filter(group %in% c("mda_infected", "tt"))

df_list <-
  list(df_mda, df_infected)

# Funnel plot for MDA trials ===================================================

png(
  filename = "output/figures/figureF1.png",
  width = 8,
  height = 8,
  units = "in",
  res = 300
)

par(mfrow = c(2,2))

for(out in outcomes) {

  print(out)

  res_mda <-
    df_mda %>%
    filter(outcome == out) %>%
    estimates()

  funnel(res_mda, main = out)

}

dev.off()

# Tables =======================================================================

## Initiating tables -----------------------------------------------------------

pub_bias_table <-
  data.frame(
    "Egger" = NULL,
    "Beggs" = NULL
  )

pub_bias_table_tt <- pub_bias_table

## Calculate p-values ----------------------------------------------------------

for(i in 1:2){
  for(out in outcomes) {

    print(paste("Publication bias test:", out))

    trial <- trial_type[i]

    res_re <-
      df_list[[i]] %>%
      filter(outcome == out) %>%
      estimates

    # Egger's test
    egger <- regtest(res_re, model = "lm")

    # Begg's test
    begg <- ranktest(res_re)

    if(i == 1){
      pub_bias_table[out, 1] <- round(egger$pva, 2)
      pub_bias_table[out, 2] <- round(begg$pval, 2)
    } else {
      pub_bias_table_tt[out, 1] <- round(egger$pval, 2)
      pub_bias_table_tt[out, 2] <- round(begg$pval, 2)
    }
  }
}

# Export tables ----------------------------------------------------------------

pub_bias_table %>%
  setNames(c("Egger", "Beggs")) %>%
  write.csv("output/tables/tableF1-A.csv")

pub_bias_table_tt %>%
  setNames(c("Egger", "Beggs")) %>%
  write.csv("output/tables/tableF2-A.csv")

# Andrews and Kasy's publication bias test =====================================
# Preparing data to upload it to the web app for A&K test

source("code/functions/metastudiesfunctions.R")


# Estimates ----------------------------

total <-
  metastudies_estimation(
    data$mean_diff, 
    data$se_mean_diff, 
    cutoffs = 1.96, 
    symmetric = TRUE, 
    model = "normal"
  ) %>%
  bind_cols() %>%
  t()

df_weight <- data %>% filter(outcome == "weight (kg)")
weight <-
  metastudies_estimation(
    df_weight$mean_diff, 
    df_weight$se_mean_diff, 
    cutoffs = 1.96, 
    symmetric = TRUE, 
    model = "normal"
  ) %>%
  bind_cols() %>%
  t()

df_height <- data %>% filter(outcome == "height (cm)")
height <-
  metastudies_estimation(
    df_height$mean_diff, 
    df_height$se_mean_diff, 
    cutoffs = 1.96, 
    symmetric = TRUE, 
    model = "normal"
  ) %>%
  bind_cols() %>%
  t()

df_hemo <- data %>% filter(outcome == "Haemoglobin")
hemo <-
  metastudies_estimation(
    df_hemo$mean_diff, 
    df_hemo$se_mean_diff, 
    cutoffs = 1.96, 
    symmetric = TRUE, 
    model = "normal"
  ) %>%
  bind_cols() %>%
  t()

df_arm <- data %>% filter(outcome == "mid-upper arm circumference (cm)")
arm <-
  metastudies_estimation(
    df_arm$mean_diff, 
    df_arm$se_mean_diff, 
    cutoffs = 1.96, 
    symmetric = TRUE, 
    model = "normal"
  ) %>%
  bind_cols() %>%
  t()

# Prepare table ------------------------------
table <-
  rbind(
    total,
    weight,
    height,
    hemo,
    arm
  ) %>%
  as.data.frame() %>%
  setNames(c("mean_diff", "se_mean_diff", "beta_p"))

rownames(table) <-
  paste(
    map(
      c(c("mortality"), outcomes), 
      ~ rep(., 2)
    ) %>% unlist,
    rep(
      c("pe", "se"),
      3
    ),
    sep = "_"
  )

# Export table -----------------------------
table %>%
  write.csv("output/tables/andrews-kasy-bias.csv")

table %>%
  write.xlsx("output/Formatted tables.xlsx", sheetName = "t9_raw", append=TRUE)
