library(tidyverse)
library(metafor)
library(meta)

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

for(out in outcomes) {
  for(i in 1:2) {

    trial <- trial_type[i]

    df_list[[i]] %>%
      filter(outcome == out) %>%
      select(mean_diff, se_mean_diff) %>%
      write_csv(
        paste0("data/pub_bias/data_ak_", out, trial, ".csv"),
        col_names = F
      )
  }
}

# Tables for AK test

# (1) Weight
# MDA
weight_mda <- c(0.184,0.284,1.962)
weight_mda_sd <- c(0.108,0.120,1.587)

# MDA + tt
weight_mdatt <- c(0.322,0.348,0.961)
weight_mdatt_sd <- c(0.138,0.145,0.785)

# (2) Height
# MDA
height_mda <- c(0.055,0,0.419)
height_mda_sd <- c(0.027, 0, 0.281)

# MDA + tt
height_mdatt <- c(0.151,0.118,0.854)
height_mdatt_sd <- c(0.08,0.097,0.766)

# (3) MUAC

# MDA
muac_mda <- c(0.112,0.191,0.706)
muac_mda_sd <- c(0.116,0.048,0.943)

# MDA + tt
muac_mdatt <- c(0.112,0.191,0.706)
muac_mdatt_sd <- c(0.116,0.048,0.943)

# (4) Haemoglobin

# MDA
hem_mda <- c(0.017,0,0.685)
hem_mda_sd <- c(0.021,0,0.726)

# MDA + tt
hem_mdatt <- c(0.106,0,0.937)
hem_mdatt_sd <- c(0.065,0,1.056)

# Final AK df

# Only MDA
df_ak_mda <-  rbind(
  weight_mda, weight_mda_sd,
  height_mda, height_mda_sd,
  muac_mda, muac_mda_sd,
  hem_mda, hem_mda_sd
) %>%
  as.data.frame() %>%
  mutate(
    variable=c("Weight","", "Height","",
               "MUAC","", "Haemoglobin", "")
  )

colnames(df_ak_mda) <- c("theta", "hypersd", "betap")

# MDA +tt

df_ak_mda_tt <-  rbind(
  weight_mdatt, weight_mdatt_sd,
  height_mdatt, height_mdatt_sd,
  muac_mdatt, muac_mdatt_sd,
  hem_mdatt, hem_mdatt_sd
) %>%
  as.data.frame() %>%
  mutate(
    variable=c("Weight","", "Height","",
               "MUAC","", "Haemoglobin", "")
  )

colnames(df_ak_mda_tt) <- c("theta", "hypersd", "betap")

# Saving datasets
df_ak_mda %>%
  write_csv("output/tables/pub-bias-AK_mda.csv")

df_ak_mda_tt %>%
  write_csv("output/tables/pub-bias-AK_mda_tt.csv")
