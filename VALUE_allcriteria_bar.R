
# bar chart with all VALUE criteria

eng_totals <- all_eng[c("Discipline", "PS1.1", "PS2.1", "PS3.1", "PS4.1", "PS5.1", "PS6.1", "CT1.1", "CT2.1", "CT3.1", "CT4.1", "CT5.1", "WC1.1", "WC2.1", "WC3.1", "WC4.1", "WC5.1")]
value <- c("ps","ps","ps","ps","ps","ps","ct","ct","ct","ct","ct","wc","wc","wc","wc","wc")


eng_totals <- eng_totals %>% 
  select(-Discipline) %>% 
  gather(learning_outcome, mean, PS1.1:WC5.1) %>%
  cbind(value) # add column defining type of VALUE criteria (ps or ct or wc)

ggplot(
  data = eng_totals, 
  aes(x = learning_outcome, y = mean, fill = value) # x value is the factor column so bars plot in ascending order
  )+
  geom_bar(stat = "identity", width = 0.5) + 
  coord_cartesian(ylim = c(0, 4)) +  
  theme(
    axis.line = element_line("grey"), #change colour of x and y axis
    panel.grid.major.y = element_line("grey"), #change horizonatal line colour (from white)
    panel.background = element_rect("white"), #change background colour
    panel.grid.major.x = element_blank(), #remove vertical white lines
    legend.position="none", #remove legend
    plot.title = element_text(size = 15),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12) #size of x axis labels
  ) +
  labs(title = graph_title,  x = "Discipline", y = "Average Rubric Level")

