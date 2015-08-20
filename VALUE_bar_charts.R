# bar charts

source("set_up.R")

# Choose-----------------------------------------------
value_scores <- ps
all_eng_avg <- all_eng_ps
graph_title <- "Average Problem Solving VALUE Scores"
main_colour <- "#33CC44" #green
highlight <- "#1F7A29" # darker green for average line
#cols <- c(main_colour, main_colour, main_colour, main_colour, main_colour,main_colour, main_colour, highlight)

value_scores <- ct
all_eng_avg <- all_eng_ct
graph_title <- "Average Critical Thinking VALUE Scores"
main_colour <- "#3388EE"  #blue
highlight <- "#1F528F" #darker blue
#cols <- c(main_colour, main_colour, main_colour, main_colour, main_colour, main_colour,main_colour, main_colour, highlight)

value_scores <- wc
all_eng_avg <- all_eng_wc
graph_title <- "Average Written Communication VALUE Scores"
main_colour <- "#FF8833" #orange
highlight <- "#CC5200" #darker orange
#cols <- c(main_colour, main_colour, main_colour, main_colour, main_colour, main_colour,main_colour, main_colour, highlight)

## plot --------------------------------------------
ggplot(
  data = value_scores, 
  aes(x = ordering, y = score , fill = Discipline) # x value is the factor column so bars plot in ascending order
  )+
  geom_hline(yintercept = all_eng_avg, # line of average all eng score
    colour = highlight, # darker colour
    size = 1,
    linetype = 'dashed'
    ) +
  geom_bar(stat = "identity", width = 0.5, fill = main_colour) + 
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
  annotate(
    "text", 
    x = 0.5,
    y = all_eng_avg + 0.15,
    size = 4,
    fontface = "bold",
    hjust = 0, # justify left
    colour = highlight,
    label = "Engineering Average"
    )
#+
 # scale_fill_manual(values = cols) # customized colours above; total bar is darker

# set up data frame for facet plot ----------------

ps_facet <- ps %>% mutate(learning_outcome = "Problem Solving")
ct_facet <- ct %>% mutate(learning_outcome = "Critical Thinking")
wc_facet <- wc %>% mutate(learning_outcome = "Written Comm.")

facet_scores <- rbind(ps_facet, ct_facet, wc_facet)

hline_avg <- data.frame(
  avg = c(all_eng_ct, all_eng_ps, all_eng_wc),
  learning_outcome = c("Critical Thinking", "Problem Solving", "Written Comm.")
  ) #data frame to plot outcome average in each facet

#facet plot -----------------------------

ggplot(
  data = facet_scores, 
  aes(x = Discipline, y = score, fill = learning_outcome) 
  )+
  facet_grid(learning_outcome~.) +
  geom_hline(data = hline_avg, aes(yintercept = avg, colour = learning_outcome), 
    size = 1,
    linetype = 'dashed'  
    ) +
  geom_bar(stat = "identity", width = 0.5) + 
  coord_cartesian(ylim = c(0, 4)) +  
  theme(
    axis.line = element_line("grey"), #change colour of x and y axis
    panel.grid.major.y = element_line("grey"), #change horizonatal line colour (from white)
    panel.background = element_rect("white"), #change background colour
    panel.grid.major.x = element_blank(), #remove vertical white lines
    panel.margin = unit(0.6, "lines"), # increase space between facet plots
    legend.position = "none", # remove legend
    plot.title = element_text(size = 15),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12), #size of x axis labels
    strip.text = element_text(size = 12, face = "bold") # size and font of facet labels
    ) +
  labs(title = graph_title,  x = "Engineering Discipline", y = "Average Rubric Level") +
  scale_fill_manual(
    values = c("#3388ee", "#33cc44", "#ff8833")
    ) +
  scale_colour_manual(
    values = c("#1F528F", "#1F7A29", "#CC5200") # colours for average lines
    ) 