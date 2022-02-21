
# install.packages("tidyverse")
library(tidyverse) # or 
library(dplyr) # if you have installed tidyverse you can use dplyr because dplyr is part of tidyverse

# data frame----
?data.frame # to know more about data frame
# let us make a data frame before we go to plant data

name <- c("saneesh", "sanusha", "Appu", "Kuttan", "Neeraja") # here name is one column name
sex <- c(1,2,1, 1, 2) # here sex is one column name
age <- c(40, 33, 8, 48, 32) # here age is one column name
height <- c("tall", 'short', 'tall', 'tall', 'short')
weight <- c(62, 48, 20, 72, 60)
# we made three vectors

typeof(name)
class(name)

# let us make a data frame
mydf <- data.frame(name,sex,age, height) # mydf is the short form I gave for my data frame :)

# to understand content of the data frame we can use the following
mydf
mydf %>% view() # adding view () will open a new tab and pipe %>% can only be used if you are using tidyverse or dplyr
str(mydf)
glimpse(mydf) # glimpse () can only be used if you are using tidyverse or dplyr
summary(mydf)

# select----
# let us check the variable column age
mydf %>% select(age)
# homework----
# try with other variables 

mydf %>% select(x) # replace x with a variable in the data frame

# we can select multiple variables

mydf %>% select(name, age)
# homework----
mydf %>% select(x, x) # replace x with another variables

mydf %>% select(-age) # here except age all others are selected

mydf %>% select(sex:height) # here coloums starting from sex to height is selected

# spread of data----
mydf %>% select(age) %>% summarise(min(age)) # min= minimum
mydf %>% select(age) %>% summarise(max(age)) # max= maximum
mydf %>% select(age) %>% summarise(sd(age)) # sd= standard deviation 
mydf %>% select(age) %>% summarise(mean(age)) # mean= average

# we can do everything together
mydf %>% select(age) %>% summarise(min(age), max(age), sd(age), mean(age))

# mutate----
# recode----

mydf %>% select(name)


# in the name column saneesh and sanusha begin with lower case
# but should be upper case because those are names
# we can recode those values by the following line of code 
mydf %>% mutate(name=recode(name,"saneesh"= "Saneesh",
                                    "sanusha"= "Sanusha"))
# we used two functions at the same time, mutate and recode
# check if it has changed.
mydf %>% select(name)
glimpse(mydf) # it is still lower case!!! why?
# homework----
# hint-- mydf <- 

# check if it has changed.
glimpse(mydf)

# visualize data ----
# exploratory graphs will help us understand data better

# install.packages("tidyverse")
library(ggplot2) # if you have installed tidyverse you can use ggplot2, ggplot is also part of tidyverse

# scatter plot----
?geom_point

# do not run the following line, read it :)
ggplot(data= fill, mapping= aes(x= fill, y= fill))+
  geom_point() # replace fill with information we have

# by convention x axis is independent variable and y axis is dependent variable
# we are assuming that weight gain with age.
# or weight is dependent on age

# push the following command to check
ggplot(data= mydf, mapping= aes(x= age, y= weight))+
  geom_point()
# click on zoom on the Plots window to see it big

# homework----
# write what do you think of relationship with age and weight from the graph?

# box plot----

ggplot(data= mydf, mapping = aes(y=weight))+
  geom_boxplot()
# this is a summary of weight in our data frame
# here we can see min, max, mean and IQR of weight

# let us compare weight of sex 
ggplot(data= mydf, mapping = aes(y=weight, x= sex))+
  geom_boxplot()

# above command made a plot but not really useful
# because 
glimpse(mydf)
# sex is understood as double or number
# we have to tell r this is not a number but a factor
?factor

mydf <- mydf %>% mutate(sex=as.factor(sex))
# homework----
# which ones are functions and which are variables

glimpse(mydf)

# same code below the note
# let us compare weight of sex 
ggplot(data= mydf, mapping = aes(y=weight, x= sex))+
  geom_boxplot()

# I think instead of 1, 2 = Male and Female are good names for categorizing sex
# 4. homework----
# recode 1 and 2 to Male and Female
# 5. homework----
# make a box x= sex and y= height

# filter----

# let us filter only Female entries from the data frame



mydf %>% filter(sex== 2) # If you changed the name earlier, use the changed name.
mydf %>% filter(sex== Female)

# more filter----

# filter all short people
mydf %>% filter(height== "short")

# filter people older than 32

mydf %>% filter(age>32)

# barplot----

ggplot(mydf, aes(x= sex))+
  geom_bar()

ggplot(mydf, aes(x= sex, fill= sex))+
  geom_bar() # added a new feature to graph to make it good looking!!

# homework----
# make a barplot on the x axis height, fill sex

# now if you want to save the plot as pdf, jpg, png, etc
# assign the plot to a name

myfirstplot <- ggplot(mydf, aes(x= height, fill= height))+
  geom_bar()
myfirstplot

mysecondplot <- ggplot(mydf, aes(x= height, y= age, color= sex, size= age))+
  geom_point()
mysecondplot

# them use ggsave(name of the plot)
ggsave("myfirstplot.jpg") # this can be seen in your folder
ggsave("mysecondplot.pdf")
ggsave("myfirstplot.png", width = 5, height = 5, dpi = 200)

# 6. homework----
# save previous plots also the same way and share with the group
# make more plots to get more experience and score :) !!

# select and filter
mydf %>% select(name, height, age) %>% filter(age>35) # greater than
mydf %>% select(name, height, age) %>% filter(age>=35) # grater than or wqual to
mydf %>% select(name, height, age) %>% filter(age<35) # less than
mydf %>% select(name, height, age) %>% filter(age<=33) # less than or equal to
mydf %>% select(name, height, age) %>% filter(age==35) # equal to
mydf %>% select(name, height, age) %>% filter(age==33)# equal to
mydf %>% select(name, height, age) %>% filter(age!=33) # not equal to 

# Go to Session > Restart R or Ctrl+Shift+F10

# plants----
# let us get back to plants data set
plants <- read.csv("fruiting_plants.csv")
View(plants)

library(tidyverse)

glimpse(plants)

names(plants) %>% tibble()

# clean names----
# let us clean column titles
# install.packages('janitor')
library(janitor) 

plants <- plants %>% clean_names() # cleaned names

names(plants) %>% view()
names(plants) %>% tibble()

# If you want use clean_names later save it 
# view(plants)
# case change----
glimpse(plants)

plants$common_name # notice that some names are in lower case, ideally a name should be in uppercase

# select----
plants %>% select(common_name)# notice that some names are in lower case, ideally a name should be in uppercase

# to do this, stringr has a function, install stringr, remove the hash that is before install.package()

# install.packages('stringr') 

library(stringr)

plants <- plants %>% 
  mutate(common_name = ifelse(str_detect(common_name, "^[:upper:]+$"), 
                              common_name, str_to_title(common_name)))

view(plants$have_you_seen_this_plant)

plants %>% select(have_you_seen_this_plant) # %>% view()


plants <- plants %>% 
  mutate(have_you_seen_this_plant = ifelse(str_detect(have_you_seen_this_plant, "^[:upper:]+$"), 
                                           have_you_seen_this_plant, str_to_title(have_you_seen_this_plant)))


view(plants)
names(plants)

# recode----
plants %>% select(scientific_name )

# the way scientific names are written is as follows: Homo sapiens, Panthera tigris, Elephas maximus
# genus uppercase and species lowercase
# recode (x, oldname = newname)

plants <- plants %>% mutate(scientific_name=recode(scientific_name,'Prunusavium'= 'Prunus avium'))
plants %>% select(scientific_name )

# homework----
# recode Ficuscarica give a space between Ficus carica
plants %>% select(scientific_name)
# recode Vitis Vinifera, species to lowercase 
plants %>% select(scientific_name)

# height----

# there are a lots of mistakes, take care while you enter data
# It is good to change data in the csv file rather than doing like this !!!

plants %>% select(height_in_m)
typeof(plants$height_in_m)
glimpse(plants) # note that height_in_m was character now it is a dbl or numeric value

# circumference----
plants %>% select(common_name, trunk_circumference_in_m )

# there are lot of NA and wrong entries so I manually changed in the csv file

# factors----
glimpse(plants)

is.factor(plants$demand_in_the_market)
is.factor(plants$have_you_seen_this_plant)
# demand_in_the_market and have_you_seen_this_plant can be ordered if we want
# to do that we need to convert the values as factors 
plants <- plants %>% mutate(demand_in_the_market= as.factor(demand_in_the_market))
is.factor(plants$demand_in_the_market)
# following is the base r way of converting character as factor
plants$demand_in_the_market <- as.factor(plants$demand_in_the_market)

is.factor(plants$demand_in_the_market)

# have you seen this plant

is.factor(plants$have_you_seen_this_plant)
#  conver to factor
plants <- plants %>% mutate(have_you_seen_this_plant= as.factor(have_you_seen_this_plant))

levels(plants$have_you_seen_this_plant)

is.factor(plants$have_you_seen_this_plant) # to check if a variable or a column is a factor
is.numeric(plants$trunk_circumference_in_m) # to check if numeric
is.numeric(plants$have_you_seen_this_plant) # same as above
is.character(plants$name_of_your_state)

# descriptive statistics ----

# Descriptive statistics summarizes or describes the characteristics of a data
# set. Descriptive statistics consists of two basic categories of measures: 
# measures of central tendency and measures of variability (or spread)

# we will make tables to summarise numeric variables
# we will make contingency tales to summarise categorical variables

# now we have a clean data

# we are interested in what is happening with height of our plants
# spread of the data----
min(plants$height_in_m) 
max(plants$height_in_m)
range(plants$height_in_m)
IQR(plants$height_in_m) # IQR may also be called the midspread, middle 50%
# The interquartile range of an observation variable is the difference of its upper and 
# lower quartiles. 
# It is a measure of how far apart the middle portion of data spreads in value.

# centrality of the data----
mean(plants$height_in_m)
median(plants$height_in_m)
sd(plants$height_in_m)
# variance----
var(plants$height_in_m) # The variance is a numerical measure of how the data values is dispersed around the mean

# summary----
summary(plants)

# let us select two variables and see
plants %>% select(height_in_m, trunk_circumference_in_m) %>% 
  summary()

# we want to see demand if demand is based on color of flower color
plants %>% group_by(demand_in_the_market, flower_color) %>% 
  summarise() # %>% view()

# homework----

# see if the same is with fruit_color

# barplot----
ggplot(plants, aes(x= fruit_color))+
  geom_bar()

# homework----
copy the code above add color (hint: fill) to demand_in_the_market

# homework----
# save the above plot as a jpg and share

# What color flowers are there?

plants %>% distinct(flower_color) # using pipe or tidyverse way
unique(plants$flower_color) # base r way 
table(plants$flower_color)
table(plants$flower_color) %>% tibble()

plants %>% distinct(fruit_color)


plants <- plants %>% mutate(flower_color=recode(flower_color, 'yellow'='yellow' ))

plants %>% select(flower_color) %>% 
  distinct()

# select----
plants %>% 
  select(common_name)

# filter----

# select plants which have small, let us say less than 10 meter
plants %>% select(common_name, height_in_m) %>% 
  filter(height_in_m<10) # less than 10 meter tall

# equal and less than 10 meter  
plants %>% select(common_name, height_in_m) %>% 
  filter(height_in_m<=10)

plants %>% select(common_name, height_in_m) %>% 
  filter(height_in_m>25)

# group----
# demand in the market
plants %>% group_by(demand_in_the_market) %>% 
  summarise(number=n())

# flower color
plants %>% 
  group_by(flower_color) %>% 
  summarise(Lower= min(number_of_products),
            Average= mean(number_of_products),
            Upper= max(number_of_products),
            Range= max(number_of_products)- min(number_of_products)) %>% 
  arrange(Average) # %>% view()

ggplot(plants, aes(flower_color, number_of_products))+
  geom_bar(stat = "identity")

ggplot(plants, aes(flower_color, number_of_countries))+
  geom_bar(stat = "identity")

# select----
plants %>% 
  select(common_name)

boxplot(plants$height_in_m) # base r way

plants %>% 
  summarise(height_in_m)
# arrange----
# order-----
plants %>% arrange(height_in_m) # order height in ascending order
plants %>% arrange(desc(height_in_m)) # order height in descending order

# homeowork----
# order other numeric variables and character variables

plants %>% group_by(name_of_your_state) %>% 
  count(common_name)

ggplot(plants, aes(name_of_your_state, fill= common_name))+
  geom_histogram(stat = "count")

ggplot(plants, aes(common_name,height_in_m, size=height_in_m, color=common_name ))+
  geom_point()

ggplot(plants, aes(height_in_m , trunk_circumference_in_m))+
  geom_point()+
  geom_smooth(method = "lm")

ggplot(plants, aes(common_name, varities, size=number_of_countries))+
  geom_point()+ # i dont think apple is only in xx countries
coord_flip() # typeof(plants$Number.of.countries), re code to a meaningful number

ggplot(plants, aes(x=common_name, y= energy_kcal, fill=number_of_products))+
  geom_bar(stat = "identity")+
  geom_text(aes(label=energy_kcal), vjust=0.5, color="black", size=3) # + coord_flip()

ggplot(plants, aes(x=number_of_countries, y= number_of_products, 
                   col=common_name, size= energy_kcal))+ geom_point()

# do all homeworks, no matter if there are mistakes but do it.
# add your doubts as comments 
# mail it to me
# thank you---


