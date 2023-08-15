# This script creates a graph with the results saved in "output/tables/compare_decisions.csv"
# Created by Luiza Andrade on August 2023

library(tidyverse)

data <-
  read_csv("output/tables/compare_decisions.csv") %>%
  mutate(
    source =
      paste(
        sample,
        estimates,
        prevalence,
        sep = "; "
      )
  )


data %>%
  ggplot() %>%
  geom_point(
    aes(
      x = pe
    )
  ) +
  geom_segment(
    aes(
      x = ll95,
      xend = ul95
    ),
    color = "grey50"
  ) +
  geom_segment(
    aes(
      x = ll90,
      xend = ul90
    ),
    color = "black"
  )

######################
# Set up forest plot
######################
#o <- "weight"
o <- "height"

for(o in c("weight", "height")){
  #set min and max for plot
  if (o=="weight"){
    pe <- dta$weight_pe
    se <- dta$weight_se
  } else if (o=="height"){
    pe <- dta$height_pe
    se <- dta$height_se
  }

  lo       = min(pe - 1.96*se)*1.1
  hi       = max(pe + 1.96*se)*1.1
  len = hi-lo

  #set up output file
  if (o=="weight"){
    thiswidth <- 600
  } else if (o=="height"){
    thiswidth <- 300
  }
  png(filename="output/figures/metaforest"%&% o %&% ".png", res=95, width=thiswidth, height=400,)
  par(mar=c(4,6,0,2))

  #do the forest plot
  if (o=="weight"){
    thisxlab <- "Effect of Deworming in kg"
  } else if (o=="height"){
    thisxlab <- "Effect of Deworming in cm"
  }

  leftedge  <- 1
  rightedge <- 0
  res1 <- rma(yi=pe, sei=se, method="DL", slab=dta$study)
  if (o=="height"){
    res1 <- rma(yi=pe, sei=se, method="DL", slab=c(""," "," "," "," "))
    leftedge <- 0
  }

  if (o=="weight"){
    forest(res1, addfit=FALSE, refline=0, xlim=c(lo-len*leftedge, hi+len*rightedge), alim=c(lo,hi),
           xlab=thisxlab, lty="solid", bg="red", psize=0.6, level=5,
           annotate=FALSE)
  } else if (o=="height"){
    forest(res1, addfit=FALSE, refline=0, xlim=c(lo-len*leftedge, hi+len*rightedge), alim=c(lo,hi),
           xlab=thisxlab, lty="solid", bg="red", psize=0.6, level=5,
           annotate=FALSE, slab=c(""," "," "," "," "))
  }

  #add 95% and 90% error bars
  segments(pe-1.96*se, length(dta$study):1, pe+1.96*se, length(dta$study):1, col="grey50",lty=1, lwd=8)
  segments(pe-1.65*se, length(dta$study):1, pe+1.65*se, length(dta$study):1, col="grey5",lty=1, lwd=8)

  #add bigger point estimate marker
  points(pe, length(dta$study):1, pch=15, cex=2)

  #add effect size label
  text(pe,length(dta$study):1,pe,pos=3)

  #add column headers and legend
  if (o=="weight") {
    text( lo-len*leftedge        , length(dta$study)+1.5, "Study"               , pos=4)
  }

  dev.off()

  #make a legend
  png(filename="output/figures/metaforest_legend.png", res=95, width=1000, height=40)
  par(mar=c(0,0,0,0))
  plot(1,xlim=c(0,1800),ylim=c(0,100),type="n",axes=F)
  rect(650, 15, 725, 85,col="grey5",border=NA)
  text(800, 50, "95% CI", cex=1)
  rect(1000, 15, 1075, 85,col="grey50",border=NA)
  text(1150, 50, "90% CI",cex=1)
  dev.off()
}
