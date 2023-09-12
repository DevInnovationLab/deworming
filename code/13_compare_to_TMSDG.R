# This script creates a graph with the results saved in "output/tables/compare_decisions.csv"
# Created by Luiza Andrade on August 2023

library(tidyverse)
library(here)

data <-
  read_csv(
    here(
      "output/tables/compare_decisions.csv"
    )
  ) %>%
  mutate(
    source =
      paste(
        estimates,
        prevalence %>% str_replace_all("≥", "Over "),
        sep = "\n"
      ),
    outcome =
      factor(
        outcome,
        levels = c(
          "Weight (kg)",
          "MUAC (cm)",
          "Height (cm)",
          "Hb (g/dL)"
        ),
        ordered = TRUE
      )
  ) %>%
  pivot_longer(
    cols = c(ul90, ll90, ul95, ll95),
    names_to = c(".value", "ci"),
    names_pattern = "(..)(..)"
  ) %>%
  mutate(
    ci = factor(
      ci,
      levels = c(90, 95),
      labels = c("90% CI", "95% CI"),
      ordered = TRUE
    ),
    xline_y = case_when(
      sample == "This paper's studies" ~ .4
    ),
    xline_x = case_when(
      sample == "Taylor-Robinson (2015) studies" ~ NA,
      outcome == "Weight (kg)" ~ -.1,
      outcome == "MUAC (cm)" ~ -.2,
      outcome == "Height (cm)" ~ -.2,
      outcome == "Hb (g/dL)" ~ -.1
    ),
    xline_xend = case_when(
      sample == "Taylor-Robinson (2015) studies" ~ NA,
      outcome == "MUAC (cm)" ~ .4,
      TRUE ~ .2
    ),
    source = source %>%
      factor(
        levels = c(
          "This paper's estimates\nOver 20% prevalence",
          "This paper's estimates\nFull sample",
          "Taylor-Robinson (2019) estimates\nOver 20% prevalence",
          "Taylor-Robinson (2019) estimates\nFull sample"
        ),
        ordered = TRUE
      )
  )



linesize <- .5
fontsize <- 7.5

data %>%
  ggplot(
    aes(
      y = source,
      yend = source
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
      x = xline_x,
      xend = xline_xend,
      y = xline_y,
      yend = xline_y
    ),
    color = "black",
    size = linesize
  ) +
  geom_text(
    aes(
      x = pe,
      label = round(pe, 3)
    ),
    vjust = -1.2,
    size = 2.7
  ) +
  geom_point(
    aes(
      x = pe
    ),
    size = 3,
    shape = 15
  ) +
  facet_grid(
    sample ~ outcome,
    scale = "free_x",
    switch = "y"
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
    here(
      "output/figures/figureS1.png"
    ),
    width = 7.5,
    height = 4,
    units = c("in"),
    bg = "white"
  )

