# This program runs a series of random effects meta-analyses and organizes the output into an all-inclusive graph

# If running this code generates an error, consider the following:
#    Under the Session tab of RStudio, click "Clear Workspace"
#    Then open a fresh copy of the program and click: file-->reopen with encoding
#    Choose UTF-8. Then re-run the code.

library(metafor)
library(meta)
library(assertthat)
library(gtools)
library(tidyverse)

#define a function to help insert underlined text in plots
underlined <- function(x, y, label, ...){
  text(x, y, label, ...)
  sw <- strwidth(label)
  sh <- strheight(label)
  lines(x + c(-sw/2, sw/2), rep(y - 1.5*sh/2, 2))
}

estimates <-
  function(data) {
    rma(
      yi = data$mean_diff,
      sei = data$se_mean_diff,
      method = "DL",
      slab = data$study
    )
  }

pval <-
  function(est) {

    md_r   = as.numeric(coef(summary(est))[1])
    se_r   = as.numeric(coef(summary(est))[2])
    pval = signif(round(2*pnorm(-abs(md_r/se_r)),digits=3),8)

    ifelse(pval < 0.001, "<0.001", pval)
  }

options(scipen = 999)

data <-
  read_csv("data/main/mda_tt_long.csv") %>%
  # sort studies by point estimate (high to low). This matters for the order of studies in the forest plots
  arrange(desc(mean_diff))

# Loop over outcomes and create plots ##########################################

for (out in c("weight (kg)", "height (cm)", "mid-upper arm circumference (cm)", "Haemoglobin (g/dL)")) {

  ## Subset data =================================================================

  outcome_data <-
    data %>%
    filter(outcome == out)

  ### Prevalence < 20% ------------------------------------------------------------

  low_prev <-
    outcome_data %>%
    filter(
      group == "mda",
      prevalence_high == 0
    )

  ### Prevalence > 20% -----------------------------------------------------------

  high_prev <-
    outcome_data %>%
    filter(
      group == "mda",
      prevalence_high == 1
    )

  ### All MDA trials -------------------------------------------------------------

  all_mda <-
    bind_rows(
      high_prev, low_prev
    )

  ### Test-and-treat -------------------------------------------------------------

  tt <-
    outcome_data %>%
    filter(
      group == "tt"
    )

  ### All studies ----------------------------------------------------------------

  all <-
    bind_rows(
      tt, all_mda
    )

  ### MDA trials, effects on infected children -----------------------------------

  mda_infected <-
    outcome_data %>%
    filter(group == "mda_infected")

  ### Infected children (MDA + tt) -----------------------------------------------

  infected <-
    outcome_data %>%
    filter(group %in% c("mda_infected", "tt"))

  ## Get RE estimates ============================================================

  ### All studies ----------------------------------------------------------------

  res_all <- estimates(all)
  pval_r <- pval(res_all)

  ### Prevalence < 20% -----------------------------------------------------------

  res_low_prev <- estimates(low_prev)
  pval_low_prev <- pval(res_low_prev)

  ### Prevalence > 20% -----------------------------------------------------------

  res_high_prev <- estimates(high_prev)
  pval_high_prev <- pval(res_high_prev)

  ### All MDA trials -------------------------------------------------------------

  res_mda <- estimates(all_mda)
  pval_mda <- pval(res_mda)

  ### Test-and-treat -------------------------------------------------------------

  res_tt <- estimates(tt)
  pval_tt <- pval(res_tt)

  ### MDA trials, effects on infected children -----------------------------------

  res_mda_infected <- estimates(mda_infected)
  pval_mda_infected <- pval(res_mda_infected)

  ### Infected children (MDA + tt) -----------------------------------------------

  res_infected <- estimates(infected)
  pval_infected <- pval(res_infected)

  ## All-in-one forest plot =====================================================

  #set min and max for plot
  lo       = min(all$mean_diff - 1.96*all$se_mean_diff)*1.1
  hi       = max(all$mean_diff + 1.96*all$se_mean_diff)*1.1

  lo = max(lo,-1.5)
  hi = min(hi,2.4)

  len = hi-lo

  if (out=="weight (kg)") {
    hi = min(hi,2)
  } else if (out=="mid-upper arm circumference (cm)") {
    lo = max(lo,-0.8)
  } else if (out=="height (cm)") {
    hi = min(hi,2.6)
    lo = -1.8
  }

  #set up labels
  ntype=c()
  ntype[all$clustered==1] <- "clusters"
  ntype[all$clustered==0] <- "individuals"
  n_label = paste(all$N, ntype,sep=" ")

  #set up output file

  if (out == "weight (kg)") { figno = 1 }
  if (out == "mid-upper arm circumference (cm)") { figno = 2}
  if (out == "height (cm)") { figno = 3 }
  if (out == "Haemoglobin (g/dL)") { figno = 4 }

  png(
    filename = paste0(
      "output/figures/figure",
      figno,
      ".png"
    ),
    res = 95,
    width = 1020,
    height = 1020
  )
  par(mar=c(4,2,1,2))

  n1 <- nrow(low_prev)
  n2 <- nrow(high_prev)
  n3 <- nrow(tt)

  #shift all rows
  shift <- -5

  #set first row for t&t studies
  nc_lo <- 11+shift
  nc_hi <- 11+n3-1+shift

  nb_lo <- nc_hi+14
  nb_hi <- nb_lo+n2-1

  na_lo <- nb_hi+7
  na_hi <- na_lo+n1-1

  leftedge <- 0.7
  rightedge <- 0.3

  #specify the x-axis label
  if (out=="weight (kg)") {
    thisxlab <- "Effect of Deworming in kg"
  } else if (out=="mid-upper arm circumference (cm)") {
    thisxlab <- "Effect of Deworming in cm"
  } else if (out=="height (cm)") {
    thisxlab <- "Effect of Deworming in cm"
  } else if (out=="Haemoglobin (g/dL)"){
    thisxlab <- "Effect of Deworming in g/dL"
  }

  ### All studies ----------------------------------------------------------------

  forest(
    res_all,
    ylim = c(-2.5 - 3, 3 + nrow(all) + 31 + shift),
    xlim = c(lo-len*leftedge, hi+len*rightedge),
    addfit = FALSE,
    alim = c(lo, hi),
    ilab = cbind(all$country),
    ilab.xpos = c(lo-len*(leftedge-0.55)),
    refline = 0,
    xlab = thisxlab,
    lty = "solid",
    bg = "red",
    psize = 0.6,
    rows = c(nc_lo:nc_hi, nb_lo:nb_hi, na_lo:na_hi)
  )

  ### Prevalence < 20% -----------------------------------------------------------

  text(
    lo - len * leftedge,
    na_hi + 1,
    bquote(bold(underline("Panel A: MDA trials (prevalence <20%)"))),
    pos = 4,
    font = 2
  )

  addpoly(
    res_low_prev,
    row = nb_hi + 5,
    cex = 1,
    mlab = "MDA trials (prevalence <20%)"
  )

  text(
    lo - len * leftedge,
    nb_hi + 4,
    paste0("  P-value = ", pval_low_prev),
    pos = 4
  )

  ### Prevalence > 20% ------------------------------------------------------------

  text(
    lo - len * leftedge,
    nb_hi + 1,
    bquote(bold(underline("Panel B: MDA trials (prevalence >20%)"))),
    pos = 4,
    font = 2
  )

  addpoly(
    res_high_prev,
    row = nc_hi + 12,
    cex = 1,
    mlab = "MDA trials (prevalence >20%)"
  )

  text(
    lo - len * leftedge,
    nc_hi + 11,
    paste0("  P-value = ", pval_high_prev),
    pos = 4
  )

  ### All MDA trials --------------------------------------------------------------

  addpoly(
    res_mda,
    row = nc_hi + 9,
    cex = 1,
    mlab = "All MDA trials"
  )

  text(
    lo - len * leftedge,
    nc_hi + 8,
    paste0("  P-value = ", pval_mda),
    pos = 4
  )

  text(
    lo - len * leftedge,
    nc_hi + 7,
    paste0("  I^2 = ", round(res_mda$I2,2), "%"),
    pos = 4
  )

  ### MDA trials, effects on infected children -----------------------------------

  addpoly(
    res_mda_infected,
    row = nc_hi + 6,
    cex = 1,
    mlab = "Effects on infected children (all MDA trials)"
  )

  text(
    lo - len * leftedge,
    nc_hi + 5,
    paste0("  P-value = ", pval_mda_infected),
    pos = 4
  )

  ### Test and treat trials ------------------------------------------------------

  text(
    lo - len* leftedge,
    nc_hi + 1,
    bquote(bold(underline("Panel C: Test-and-treat trials"))),
    pos = 4,
    font = 2
  )

  addpoly(
    res_tt,
    row = 9 + shift,
    cex = 1,
    mlab = "Test-and-treat trials"
  )

  text(
    lo - len * leftedge,
    8 + shift,
    paste0("  P-value = ", pval_tt),
    pos = 4
  )

  ### Infected children (MDA + tt) -----------------------------------------------

  addpoly(
    res_infected,
    row = 4 + shift,
    cex = 1,
    mlab = "Effects on infected children (MDA and test-and-treat trials)"
  )

  text(
    lo - len * leftedge,
    3 + shift,
    paste0("  P-value = ", pval_infected),
    pos = 4
  )

  ## Add column headers ----------------------------------------------------------
  text( lo-len*leftedge        , 1.3+nrow(all)+31+shift, "Study"               , pos=4)
  text( lo-len*(leftedge-0.48) , 1.3+nrow(all)+31+shift, "Country"              , pos=4)
  text( hi+len*rightedge       , 1.3+nrow(all)+31+shift, "Effect size (95% CI)", pos=2)

  dev.off()
}
