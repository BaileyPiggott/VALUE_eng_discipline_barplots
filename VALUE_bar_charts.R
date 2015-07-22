
# bar charts

source("set_up.R")


## plot
ggplot(
  data = ct, 
  aes(
    x = Discipline, y = score
    )
  )+
  geom_bar(
    stat = "identity",
    position = "dodge"       
    ) + 
  coord_cartesian(ylim = c(0, 4)) + 
  theme(
    axis.line = element_line("grey"), #change colour of x and y axis
    panel.grid.major.y = element_line("grey"), #change horizonatal line colour (from white)
    panel.background = element_rect("white") #change background colour
    ) +
  labs(title = "VALUE Data", x = "Discipline", y = "Average Rubric Level") 

