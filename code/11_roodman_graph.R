# This program runs a series of random effects meta-analyses and organizes the output into an all-inclusive graph

# If running this code generates an error, consider the following:
#    Under the Session tab of RStudio, click "Clear Workspace"
#    Then open a fresh copy of the program and click: file-->reopen with encoding
#    Choose UTF-8. Then re-run the code.

library(metafor)
library(assertthat)
library(gtools)
library(tidyverse)
library(here)
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
data <-
  here("data/main/metaanalysis_data.csv") %>%
  read.csv(stringsAsFactors=FALSE) %>%
  mutate(
    across(
      contains("_"),
      ~ round(., 3)
    )
  ) %>%
  pivot_longer(
    cols = -study,
    names_to = c('outcome', '.value'),
    names_pattern = '(.*)_(..)'
  ) %>%
  mutate(
    study =
      factor(
        study,
        levels = c(
          "This paper (>20% Prev.)",
          "This paper (full sample)",
          "Taylor-Robinson et al (2019)",
          "Welch et al (2016)",
          "Taylor-Robinson et al (2015)"
        ),
        ordered = TRUE
      ),
    outcome =
      factor(
        outcome,
        levels = c("weight", "height"),
        labels = c("Weight (kg)", "Height (cm)"),
        ordered = TRUE
      ),
    ul90 = pe - 1.65 * se,
    ll90 = pe + 1.65 * se,
    ul95 = pe - 1.96 * se,
    ll95 = pe + 1.96 * se
  ) %>%
  pivot_longer(
    cols = c(starts_with("ul"), starts_with("ll")),
    names_to = c('.value', 'ci'),
    names_pattern = '(..)(.*)'
  ) %>%
  mutate(
    ci = factor(
      ci,
      levels = c(90, 95),
      labels = c("90% CI", "95% CI"),
      ordered = TRUE
    )
  )


linesize <- .5
fontsize <- 12

data %>%
  ggplot(
    aes(
      y = study,
      yend = study
    )
  ) +
  geom_vline(
    xintercept = 0,
    color = "gray60",
    linetype = "dotted",
    linewidth = linesize
  ) +
  geom_segment(
    data = . %>% filter(ci == "95% CI"),
    aes(
      x = ll,
      xend = ul,
      color = ci
    ),
    linewidth = 2,
    lineend = "round"
  ) +
  geom_segment(
    data = . %>% filter(ci == "90% CI"),
    aes(
      x = ll,
      xend = ul,
      color = ci
    ),
    linewidth = 2,
    lineend = "round"
  ) +
  geom_segment(
    aes(
      x = -.1,
      xend = .2,
      y = .4,
      yend = .4
    ),
    color = "black",
    size = linesize
  ) +
  geom_text(
    aes(
      x = pe,
      label = round(pe, 3)
    ),
    vjust = -1,
    size = 4
  ) +
  geom_point(
    aes(
      x = pe
    ),
    size = 3,
    shape = 15
  ) +
  facet_wrap(
    ~ outcome,
    scale = "free_x"
  ) +
  labs(
    color = NULL,
    y = NULL
  ) +
  theme_void() +
  scale_color_manual(values = c("black", "gray50")) +
  theme(
    text = element_text(size = fontsize),
    axis.text.x = element_text(vjust = .05),
    axis.text.y = element_text(hjust = 0),
    axis.ticks.x = element_line(
      color = "black",
      size = linesize
    ),
    axis.ticks.length.x = unit(.05, "cm"),
    legend.position = "bottom",
    panel.background = element_blank(),
    strip.background = element_rect(
      fill = "gray",
      color = "gray"
    ),
    strip.placement = "outside",
    strip.text = element_text(
      size = fontsize,
      margin = margin(.1, .1, .1, .1, "cm"),
      face = "bold"
    ),
    strip.text.y = element_text(
      angle = 90,
      size = fontsize - .5,
      margin = margin(.1, .2, .1, .1, "cm")
    ),
    plot.margin = margin(.1, .1, .1, .1, "cm"),
    legend.text = element_text(size = fontsize)
  )

ggsave(
  here("output/figures/metaforest.png"),
  width = 7.5,
  height = 3,
  units = c("in"),
  bg = "white"
)

