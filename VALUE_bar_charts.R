
# bar charts

source("set_up.R")

# Choose:
value_scores <- ps
graph_title <- "Average Problem Solving VALUE Scores"
main_colour <- "#33CC44" #green
highlight <- "#1F7A29" # darker green for total bar
cols <- c(main_colour, main_colour, main_colour, main_colour, main_colour,main_colour, main_colour, highlight)

value_scores <- ct
graph_title <- "Average Critical Thinking VALUE Scores"
main_colour <- "#3388EE"  #blue
highlight <- "#1F528F" #darker blue
cols <- c(main_colour, main_colour, main_colour, main_colour, main_colour, main_colour,main_colour, main_colour, highlight)

value_scores <- wc
graph_title <- "Average Written Communication VALUE Scores"
main_colour <- "#FF8833" #orange
highlight <- "#CC5200" #darker orange
cols <- c(main_colour, main_colour, main_colour, main_colour, main_colour, main_colour,main_colour, main_colour, highlight)


## plot
ggplot(
  data = value_scores, 
  aes(x = ordering, y = score , fill = Discipline) # x value is the factor column so bars plot in ascending order
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
  labs(title = graph_title,  x = "Discipline", y = "Average Rubric Level") +
  scale_fill_manual(values = cols) # customized colours above; total bar is darker


