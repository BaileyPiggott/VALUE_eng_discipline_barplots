
# bar charts

source("set_up.R")

# Chooses:
value_scores <- ps
graph_title <- "Average Problem Solving VALUE Scores"
palette_colour <- "Greens"

value_scores <- ct
graph_title <- "Average Critical Thinking VALUE Scores"
palette_colour <- "Blues"

value_scores <- wc
graph_title <- "Average Written Communication VALUE Scores"
palette_colour <- "Oranges"


## plot
ggplot(
  data = value_scores, 
  aes(
    x = Discipline, y = score   #, fill = Discipline
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
    panel.background = element_rect("white"), #change background colour
    panel.grid.major.x = element_blank()
    ) +
  labs(title = graph_title,  x = "Discipline", y = "Average Rubric Level")

#+
 # scale_fill_brewer(palette = palette_colour)

