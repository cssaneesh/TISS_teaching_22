# before you begin -----
# make sure 
# 1. made a new folder> named it, 
# 2. open r studio> new project> name it > select the existing directory > select the folder you created, 
# 3. open final assignment in the new project

# or

# open final assignment in an existing project

# use following functions
# Your name:
Sys.time() # run this function, copy the result the paste below
# Date & Time: 
# Your email: 
# If you press Ctrl+Shift+o or click on the top right of script window (5 lines) to see the outline of the script
# NOTE: provide sufficient comments to your code, functions and graphs
# solved assignments are given at the bottom of this page 
# I TRUST you, don't look at it unless if you fully stuck :)

# Assignment 1----
# a. ----
# NOTE: provide note on the details of each vector (use #)
# make a numerical vector with a length of 10 (with 10 numbers)
# write function to read the length
# write function to read the type of the vector
# write function to view the vector on a new tab
# do calculations of your choice 

# b. ----
# NOTE: provide note on the details of each vector (use #)
# make a character vector with a length of 5 (with 5 characters)
# write function to read the length
# write function to read the type of the vector
# write function to view the vector on a new tab

# Assignment 2----
# a.----
# NOTE: provide sufficient comments to each variable
# Create a data frame (hint: mydf) with the following columns

# 1. character variable (length 6) 
# 2. character variable (e.g: yes/no, tall/short, hot/cold)
# 3. numerical variable (length 6)
# 4. numerical variable (length 6)
# 5. character variable (3 distinct names repeating twice)
# 6. assign with a name of your choice


# b. ----
# use glimpse function to see details of your data frame
# use typeof function to see type of objects in the data frame
# change the 5th character variable into a factor (hint: mutate, as.factor)
# use summary function to your data frame
# use the str function to your data frame
# view your data frame in a new tab

# c. ----

# select any of the two columns
# filter one value from the first column or a column with character variable
# filter column with numerical variable using < or > or == 

# d. -----
# find mean of a numerical variable
# find the sum of a numerical variable
# find minimum and maximum of a numerical variable

# e.----
# rename column names and save as a new data frame
# assign a new name and view it as a tibble() (hint %>% tibble())

# Assignment 3----
# NOTE: provide sufficient comments graphs and results
# a.----
# make a scatter plot with the data frame
# b.----
# make a bar plot with the data frame
# c.----
# make a box plot with the data frame
# d.---- 
# give me a surprise plot from the data frame, explore internet!

# Assignment 4----
# save all four graphs with a meaningful name as pdf or jpg
# save your code with a meaningful name 
# email me ONLY the SAVED code (THIS IS THE POWER & BEAUTY OF R)




# solved----
# Assignment 1 solved ----
nume <- c(1:10)
length(nume)
typeof(nume)
view(nume)
class(nume)


# Assignment 2 solved ----
# a----
a <- as.character(c('sa','ds','re','te', 'we', 'gf'))
b <- as.factor(c('short', 'short', 'short', 'tall', 'short', 'tall'))
c <- as.numeric(c(21,45,56,32,54,32))
d <- as.numeric(c(45,78,56,45,78,32))
e <- as.character(rep(c('red', 'green', 'blue'),2))   
# b----
mydf <- data.frame(a,b,c,d,e)
library(tidyverse)
glimpse(mydf)# use glimpse function to see details of your data frame
typeof(mydf)# use typeof function to see type of objects in the data frame
mydf <- mydf %>% mutate(e=factor(e)) %>% tibble()# change the 5th character variable into a factor (hint: mutate, as.factor)
summary(mydf)# use summary function to your data frame
str(mydf)# use the str function to your data frame
view(mydf)# view your data frame in a new tab

# c----
mydf %>% select(a,b) %>% tibble() # select any of the two columns
mydf %>% filter(a=="sa") # filter one value from the first column or a column with character variable
mydf %>% filter(c==21) # filter column with numerical variable using < or > or == 

# d. -----
mydf %>% summarise(mean(c))# mean of a numerical variable c
mydf %>% summarise(sum(d))# sum of a numerical variable d
mydf %>% summarise(min(c), max(c))# minimum and maximum of a numerical variable c
# e.----
mydf <- mydf %>% rename(name=a, bill=b, height=c, weight=d, color=e) %>% tibble() # rename column names and save as a new data frame
mydf %>% tibble() # new names!!!


# Assignment 3----
# NOTE: provide sufficient comments graphs and results
# a.----
# make a scatter plot with the data frame
ggplot(mydf, aes(x=height, y=weight, col=bill, size=weight))+
  geom_point()+ ggtitle('height vs weight')
# b.----
# make a bar plot with the data frame
ggplot(mydf, aes(x=bill, fill=name))+
  geom_bar()
# c.----
# make a box plot with the data frame
ggplot(mydf, aes(y=weight))+
  geom_boxplot()+
  facet_wrap(~bill)
# d.---- 
# give me a surprise plot from the data frame, explore internet!

# Assignment 4----
# save all four graphs with a meaningful name as pdf or jpg
# save your code with a meaningful name 

# Assignment 4----
# save all four graphs with a meaningful name as pdf or jpg
# save your code with a meaningful name 

# pdf
# scatter plot 
sctterplot <- ggplot(mydf, aes(x=height, y=weight, col=bill, size=weight))+
  geom_point()+ ggtitle('height vs weight')

ggsave('sctterplot.pdf', width = 10, height = 8)# to save as pdf

# bar plot
barplot <- ggplot(mydf, aes(x=bill, fill=name))+
  geom_bar()

ggsave('barplot.pdf', width = 10, height = 8)# to save as pdf

# box plot
boxplot <- ggplot(mydf, aes(y=weight))+
  geom_boxplot()+
  facet_wrap(~bill)

ggsave('boxplot.pdf', width = 10, height = 8)# to save as pdf


# jpeg
# scatter plot 
sctterplot <- ggplot(mydf, aes(x=height, y=weight, col=bill, size=weight))+
  geom_point()+ ggtitle('height vs weight')
ggsave('sctterplot.jpg', width = 10, height = 8) # to save as jpg

# bar plot
barplot <- ggplot(mydf, aes(x=bill, fill=name))+
  geom_bar()
ggsave('barplot.jpg', width = 10, height = 8)# to save as jpg

# box plot
boxplot <- ggplot(mydf, aes(y=weight))+
  geom_boxplot()+
  facet_wrap(~bill)
ggsave('boxplot.jpg', width = 10, height = 8)# to save as jpg






