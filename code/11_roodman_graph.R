# This program runs a series of random effects meta-analyses and organizes the output into an all-inclusive graph

# If running this code generates an error, consider the following:
#    Under the Session tab of RStudio, click "Clear Workspace"
#    Then open a fresh copy of the program and click: file-->reopen with encoding
#    Choose UTF-8. Then re-run the code.

#setwd("C:\Files\projects\worms\trunk\notes\messages\2019.11.1 worms latest draft\data files")
library(metafor)
library(assertthat)
library(gtools)
library(tidyverse)
"%&%"<-function(x,y)paste(x,y,sep="")  #define a function for easy string pasting

#define a function to help insert underlined text in plots
underlined <- function(x, y, label, ...){
  text(x, y, label, ...)
  sw <- strwidth(label)
  sh <- strheight(label)
  lines(x + c(-sw/2, sw/2), rep(y - 1.5*sh/2, 2))
}


#############################
# Read in data for the plot
#############################
datafile = "data/main/metaanalysis_data.csv"
dta =
  datafile %>%
  read.csv(stringsAsFactors=FALSE) %>%
  mutate(
    across(
      contains("_"),
      ~ round(., 3)
    )
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
