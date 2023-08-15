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
      ),
    outcome =
      factor(
        outcome,
        levels = c(
          "Weight (kg)",
          "MUAC (cm)",
          "Height (cm)",
          "Hemoglobin (g/dL)"
        ),
        ordered = TRUE
      )
  )


data %>%
  ggplot(
    aes(
      y = source,
      yend = source
    )
  ) +
  geom_vline(
    xintercept = 0,
    color = "black",
    linetype = "dotted"
  ) +
  geom_segment(
    aes(
      x = ll95,
      xend = ul95
    ),
    color = "grey50",
    size = 2.5,
    lineend = "round"
  ) +
  geom_segment(
    aes(
      x = ll90,
      xend = ul90
    ),
    color = "black",
    size = 2.5,
    lineend = "round"
  ) +
  geom_text(
    aes(
      x = pe,
      label = round(pe, 3)
    ),
    vjust = -1,
    size = 3
  ) +
  geom_segment(
    aes(
      x = -.4,
      xend = .4,
      y = 8.57,
      yend = 8.57
    ),
    color = "black"
  ) +
  geom_segment(
    aes(
      x = -.4,
      xend = .4,
      y = .4,
      yend = .4
    ),
    color = "black"
  ) +
  geom_point(
    aes(
      x = pe
    ),
    size = 4,
    shape = 15
  ) +
  facet_wrap(
    ~ outcome,
    ncol = 4
  ) +

  theme_void() +
  theme(
    axis.text = element_text(size = 8),
    axis.ticks.x = element_line(color = "black", size = .5),
    axis.ticks.length.x = unit(.15, "cm"),
    strip.text.x = element_text(size = 8, margin = margin(.25, .25, .25, .25, "cm")),
    axis.text.y = element_text(hjust = 0),
    strip.background = element_rect(color = "white")
  )
