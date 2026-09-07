##tutorial week 3
#loading data
library(tidyverse)
if (!file.exists("video_view.csv")) {
  data_url <- paste0(
    "https://raw.githubusercontent.com/hannesdatta/",
    "course-dprep/refs/heads/main/material/tutorials/r-bootcamp-rev/",
    "video_view.csv"
  )
  download.file(data_url, "video_view.csv")
}
videos <- read_csv("video_view.csv")


#ggplot
library(ggplot2)
ggplot(data = videos, aes(x = impressions_n, y = watch_rate)) +
  geom_point() +
  geom_smooth(color = "red") +
  labs(
    title = "Impressions per watch rating",
    x = "Impressions",
    y = "watch rating"
  )

#improved ggplot
library(ggplot2)

ggplot(videos, aes(x = impressions_n, y = watch_rate)) +
  geom_point(
    aes(color = "Individual videos"),
    alpha = 0.5,
    size = 2
  ) +
  geom_smooth(
    aes(color = "Trend"),
    method = "lm",
    se = FALSE,
    linewidth = 1
  ) +
  labs(
    title = "Relationship between impressions and watch rating",
    subtitle = "Each point represents one video",
    x = "Number of impressions",
    y = "Watch rating"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 11),
    legend.position = "top"
  )