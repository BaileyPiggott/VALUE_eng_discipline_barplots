
# bar chart with all VALUE criteria
source("set_up.R")


eng_totals <- all_eng[c("Discipline", "PS1.1", "PS2.1", "PS3.1", "PS4.1", "PS5.1", "PS6.1", "CT1.1", "CT2.1", "CT3.1", "CT4.1", "CT5.1", "WC1.1", "WC2.1", "WC3.1", "WC4.1", "WC5.1")]
value <- c("a","a","a","a","a","a","b","b","b","b","b","c","c","c","c","c")
criteria <- c("Define\nProblem", "Identify\nStrategies", "Propose\nSolutions", "Evaluate\nPotential\nSolutions", "Implement\nSolutions", "Evaluate\nOutcomes", "Explanation\nof Issues", "Evidence", "Influence of\nContext and\nAssumptions", "Student's\nPosition", "Conclusions", "Context and\nPurpose for\nWriting", "Content\nDevelopment", "Genre and\nDisciplinary\nConventions", "Sources and\nEvidence", "Syntax and\nMechanics")


eng_totals <- eng_totals %>% 
  select(-Discipline) %>% 
  gather(learning_outcome, mean, PS1.1:WC5.1) %>%
  cbind(value, stnd_dev) # add column defining type of VALUE criteria (ps or ct or wc) and calculated sd



##plot -------------------------------------------------
ggplot(
  data = eng_totals, 
  aes(x = learning_outcome, y = mean, fill = value) # x value is the factor column so bars plot in ascending order
  )+
  geom_bar(stat = "identity", width = 0.5) + 
  geom_errorbar(aes(ymin=mean - sd, ymax = mean + sd), width=0.25) +
  scale_x_discrete(labels = criteria) +
  coord_cartesian(ylim = c(0, 4)) +  
  theme(
    axis.line = element_line("grey"), #change colour of x and y axis
    panel.grid.major.y = element_line("grey"), #change horizonatal line colour (from white)
    panel.background = element_rect("white"), #change background colour
    panel.grid.major.x = element_blank(), #remove vertical white lines
    legend.position="none", #remove legend
    plot.title = element_text(size = 15),
    axis.title = element_text(size = 14),
    axis.ticks.x = element_blank(),
    axis.text.y = element_text(size = 12)
    #axis.text.x = element_text(size = 12)#size of x axis labels
    ) +
  labs(title = "Engineering VALUE Scores, with Standard Deviations",  x = "VALUE Criteria", y = "Average Rubric Level") +
  scale_fill_manual(values = c("#33CC44", "#3388EE", "#FF8833")) +
  annotate( # add labels for CLA mastery levels
    "text", 
    fontface = "bold", 
    size = 5,
    x = c(3.5, 9, 14), y = 3.55, 
    vjust = 0,
    label = c("Problem Solving", "Critical Thinking", "Written Communication"), 
    colour = c("#33CC44", "#3388EE", "#FF8833")
  ) 


