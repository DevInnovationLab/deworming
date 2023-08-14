library(tidyverse)
library(metafor)
library(meta)
library(openxlsx)

# Calculates Table F

data <-
  read_csv("data/main/mda_tt_long.csv") %>%
  mutate(
    outcome = str_replace_all(outcome, " [(]g/dL[)]", "")
  )

df_mda <- data %>% filter(group == "mda")
df_mda_tt <- data %>% filter(group == "mda" | group == "tt")

outcomes = c(
  "weight (kg)",
  "height (cm)",
  "mid-upper arm circumference (cm)",
  "Haemoglobin"
)

# Block A

df_A <- data.frame(z_mid = c(), z_high = c(), z_low = c(), total = c())

for (outcome_type in outcomes) {
  
  df_p <- df_mda %>% filter(outcome == outcome_type)
  
  t_df <- data.frame(z_mid = c(nrow(df_p %>% filter(abs(mean_diff / se_mean_diff) <= 1.96))),
                     z_high = c(nrow(df_p %>% filter(mean_diff / se_mean_diff > 1.96))),
                     z_low = c(nrow(df_p %>% filter(mean_diff / se_mean_diff < -1.96))), 
                     total = c(nrow(df_p)))
  
  df_A <- rbind(df_A, t_df)

}

rownames(df_A) <- outcomes

# Block A

df_B <- data.frame(z_mid = c(), z_high = c(), z_low = c(), total = c())

for (outcome_type in outcomes) {
  
  df_p <- df_mda_tt %>% filter(outcome == outcome_type)
  
  t_df <- data.frame(z_mid = c(nrow(df_p %>% filter(abs(mean_diff / se_mean_diff) <= 1.96))),
                     z_high = c(nrow(df_p %>% filter(mean_diff / se_mean_diff > 1.96))),
                     z_low = c(nrow(df_p %>% filter(mean_diff / se_mean_diff < -1.96))), 
                     total = c(nrow(df_p)))
  
  df_B <- rbind(df_B, t_df)
  
}

rownames(df_B) <- outcomes

middle <- c("-","-","-","-")

df <- rbind(df_A, middle)
df <- rbind(df,df_B)

# Export table -----------------------------
df %>%
  write.csv("output/tables/table-z-scores.csv")

wb <- loadWorkbook("output/Formatted tables.xlsx")
tryCatch(
  {
    removeWorksheet(wb, "tF_raw")
  }, error = function(cond) {
    
  }
)
addWorksheet(wb, "tF_raw")
writeData(wb,"tF_raw", df, rowNames=TRUE)
saveWorkbook(wb, "output/Formatted tables.xlsx", overwrite = TRUE)



