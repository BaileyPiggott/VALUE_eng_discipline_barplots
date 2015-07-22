
# bar charts

source("set_up.R")

# Choose:
value_scores <- ps
graph_title <- "Average Problem Solving VALUE Scores"
main_colour <- "#33CC44"

value_scores <- ct
graph_title <- "Average Critical Thinking VALUE Scores"
main_colour <- "#3388EE" 

value_scores <- wc
graph_title <- "Average Written Communication VALUE Scores"
main_colour <- "#FF8833"


## plot
ggplot(
  data = value_scores, 
  aes(
    x = Discipline, y = score  #, fill = Discipline
    )
  )+
  geom_bar(
    stat = "identity", 
    fill = main_colour
    ) + 
  coord_cartesian(ylim = c(0, 4)) +  
  theme(
    axis.line = element_line("grey"), #change colour of x and y axis
    panel.grid.major.y = element_line("grey"), #change horizonatal line colour (from white)
    panel.background = element_rect("white"), #change background colour
    panel.grid.major.x = element_blank()
    ) +
  labs(title = graph_title,  x = "Discipline", y = "Average Rubric Level") 


