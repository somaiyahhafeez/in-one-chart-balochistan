library(ggplot2)
library(readr)
library(stringr)

setwd('~/Desktop/in-one-chart')
balochistan_df = read_csv('balochistan_cleaned.csv')



balochistan_df$month = as.Date(paste0(balochistan_df$month, "-01"))

ggplot(balochistan_df, aes(x = month, y = event_count)) +  
  geom_line(color = "#D17A7A") +
  scale_y_continuous(limits = c(0, 150),
                     breaks = seq(0, 150, 25)
                     ) +
  scale_x_date(date_breaks = "1 year",
               date_labels = "%b %Y",
               limits = c(min(balochistan_df$month), max(balochistan_df$month))) + 
  labs(
    title = str_wrap("Violence in Balochistan surged during Pakistan's election month last year", width=95),
    subtitle = str_wrap("Separatist groups like Balochistan Liberation Army carried out 124 attacks in February alone. 
                        Many of these targeted the Pakistani military.", width=95),
    x = "",
    y = "Number of incidents of political violence",
    caption = "Source: ACLED – Armed Conflict Location & Event Data Project: Asia-Pacific, 24 January 2025"
  ) +
  
  
  annotate("text", x = as.Date("2024-02-01"), y = 135, color = "black",
           label = str_wrap("8 Feb. 2024: National and provincial assemblies elections were held", width = 30), 
           size = 3, family = "Arial")  +
  geom_segment(aes(x = as.Date("2023-12-01"), xend = as.Date("2024-02-01"),
                   y = 124, yend = 124),  
               arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  
  annotate("text", x = as.Date("2024-08-01"), y = 100, ccolor = "black",
           label = str_wrap("August 2024: Attacks intensified during Pakistan's independence month", width = 30), 
           size = 3, family = "Arial") + 
  geom_segment(aes(x = as.Date("2024-06-01"), xend = as.Date("2024-08-01"),
                   y = 87, yend = 87), 
               arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  theme_minimal() +
  theme(
    text = element_text(family = "Arial", size = 12),
    plot.title = element_text(face = "bold"),
  )
ggsave("~/Desktop/in-one-chart/balochistan_attacks_1.0.jpeg")
