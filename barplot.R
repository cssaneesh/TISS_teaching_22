# note for you----
# anything in r with a hash # is only for us to read, r will not read it.

# package----
library(tidyverse)

# data----

my_table <- read.csv("barplot.csv") 
# 1. my_table is the name of your choice
# 2. <- is the command to add my_table to Global Environment
# 3. read.csv is the command to read file from your computer


# plot----

ggplot(my_table, aes(y= age, x= name, fill=name))+
  geom_bar(stat = 'identity')

# ggplot is the tool box to make graph given by the big tool box (tidyverse)
# my_talbe is the name you gave in line 6
# aes is the function to select data from my table to x and y axis
# fill is the command to fill color
# geom_bar is the command to barplot

# homework----
# you can change values inside your csv file, save (make sure to save as csv)
# run the code from six and 14.

