
# bar charts of VALUE scores comparing all engineering disciplines

# set up data frames

library(ggplot2)
library(tidyr)
library(dplyr)
library(magrittr)
# load libraries

#load data

df = read.csv("APSC200 value rubric data 2015.csv", header = TRUE) # 2nd year marks
df <- df[ , -grep("Change", colnames(df))] #remove change columns

# average bailey and alyssa's scores
bailey_scores <- df %>% select (Section, Group, Discipline, PS1.1:WC5.1)
alyssa_scores <- df %>% select (Section, Group, Discipline, PS1.2:WC5.2)
colnames(alyssa_scores) <- colnames(bailey_scores) #change column names for row bind

df <- bind_rows(bailey_scores, alyssa_scores) # dataframe now has two rows per data point for the separate markers

#subset by discipline
all_eng <- df %>% subset(Discipline != "CHEE")  # take out chem scores
n_eng <- nrow(all_eng)/2
all_eng <- all_eng %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "ENG") # average of scores per criteria and change discipline to eng for plotting

mech <- df %>% subset(Discipline == "MECH")
n_mech <- nrow(mech)/2 #divide by two because the two rater scores are separate rows
mech <- mech %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "MECH")

ece <- df %>% subset(Discipline == "ELEC") #elec and cmpe
n_ece <- nrow(ece)/2 #divide by two because the two rater scores are separate rows
ece <- ece %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "ECE")

civl <- df %>% subset(Discipline == "CIVL")
n_civl <- nrow(civl)/2 #divide by two because the two rater scores are separate rows
civl <- civl %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "CIVL")

chee <- df %>% subset(Discipline == "CHEE") #chee and ench
n_chee <- nrow(chee)/2 #divide by two because the two rater scores are separate rows
chee <- chee %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "CHEE")

mine <- df %>% subset(Discipline == "MINE")
n_mine <- nrow(mine)/2 #divide by two because the two rater scores are separate rows
mine <- mine %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "MINE")

geoe <- df %>% subset(Discipline == "GEOE")
n_geoe <- nrow(geoe)/2 #divide by two because the two rater scores are separate rows
geoe <- geoe %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "GEOE")

enph <- df %>% subset(Discipline == "ENPH")
n_enph <- nrow(enph)/2 #divide by two because the two rater scores are separate rows
enph <- enph %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "ENPH")

mthe <- df %>% subset(Discipline == "MTHE")
n_mthe <- nrow(mthe)/2 #divide by two because the two rater scores are separate rows
mthe <- mthe %>% summarise_each(funs(mean(., na.rm = TRUE))) %>% mutate(Discipline = "MTHE")

all_means <- bind_rows(mech, ece, civl, chee, mine, geoe, enph, mthe) %>% select(-Group, -Section)

ps <- all_means %>% 
  select(Discipline, PS1.1, PS2.1, PS3.1, PS4.1, PS5.1,PS6.1) %>% 
  transmute(Discipline, score = rowMeans( .[, -1] , na.rm = TRUE)) # average all rows, except the first column(discipline)

ct <- all_means %>% 
  select(Discipline, CT1.1, CT2.1, CT3.1, CT4.1, CT5.1) %>% 
  transmute(Discipline, score = rowMeans( .[, -1] , na.rm = TRUE))

wc <- all_means %>% 
  select(Discipline, WC1.1, WC2.1, WC3.1, WC4.1, WC5.1) %>% 
  transmute(Discipline, score = rowMeans( .[, -1] , na.rm = TRUE))


