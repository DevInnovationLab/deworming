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
    )
  )

linesize <- .2
fontsize <- 6.7

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
    linetype = "dotted",
    size = linesize
  ) +
  geom_segment(
    data = . %>% filter(ci == "95% CI"),
    aes(
      x = ll,
      xend = ul,
      color = ci
    ),
    linewidth = 1,
    lineend = "round"
  ) +
  geom_segment(
    data = . %>% filter(ci == "90% CI"),
    aes(
      x = ll,
      xend = ul,
      color = ci
    ),
    linewidth = 1,
    lineend = "round"
  ) +
  geom_segment(
    aes(
      x = -.4,
      xend = .4,
      y = 8.57,
      yend = 8.57
    ),
    color = "black",
    size = linesize
  ) +
  geom_text(
    aes(
      x = pe,
      label = round(pe, 3)
    ),
    vjust = -.8,
    size = 2
  ) +
  geom_segment(
    aes(
      x = -.4,
      xend = .4,
      y = .4,
      yend = .4
    ),
    color = "black",
    size = linesize
  ) +
  geom_point(
    aes(
      x = pe
    ),
    size = 1,
    shape = 15
  ) +
  facet_wrap(
    ~ outcome,
    ncol = 4
  ) +
  labs(
    color = NULL
  ) +
 scale_color_manual(values = c("gray50", "black")) +
  theme_void() +
  theme(
    text = element_text(size = fontsize),
    axis.text = element_text(),
    axis.text.x = element_text(),
    axis.ticks.x = element_line(color = "black", size = linesize),
    axis.ticks.length.x = unit(.1, "cm"),
    strip.text.x = element_text(size = fontsize, margin = margin(.1, .1, .1, .1, "cm")),
    axis.text.y = element_text(hjust = 0),
    strip.background = element_rect(color = "white"),
    legend.position = "bottom",
    plot.margin = margin(.1, .1, .1, .1, "cm")
  )

  ggsave(
    "output/figures/figureS1.png",
    width = 6.5,
    height = 2.5,
    units = c("in"),
    bg = "white"
  )
