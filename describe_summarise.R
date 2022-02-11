
# before you do anything with your data you need to understand your data
# diamenstion, how big is the data is how many variables, characteristics of those variables

# install.packages("tidyverse"), a collection of packages

library(tidyverse) # to use tidyverse 

# data()

# help----
# if you have a question about some functions in r ask like this ?sum or ?mean, ?data()

#  explore data----
starwars <- starwars # starwars comes with tidyverse!


# to see the starwars data----
View(starwars)
# columns are our variables
# rows are out observations
# each cell contains values

dim(starwars)
str(starwars)
glimpse(starwars) # this functions comes with tidyverse and it is much better than str

head(starwars)
tail(starwars)
names(starwars)
length(starwars)
length(starwars$name)

class(starwars$name)
class(starwars$mass)

unique(starwars$hair_color) # notice there is an NA, none, unknown?

table(starwars$skin_color)

sort(table(starwars$skin_color))
sort(table(starwars$skin_color), decreasing = FALSE)
sort(table(starwars$skin_color), decreasing = TRUE)
View(sort(table(starwars$skin_color), decreasing = TRUE)) # but this is sort of difficult to read

# the tidyverse way of doing the same is 

starwars %>% 
  select(skin_color) %>% 
  count(skin_color) %>% 
  arrange(desc(n)) %>% tibble() # to see in console

starwars %>% 
  select(skin_color) %>% 
  count(skin_color) %>% 
  arrange(desc(n)) %>% View() # to see in a new tab


barplot(sort(table(starwars$skin_color), decreasing = TRUE)) #  for character variable

barplot(sort(table(starwars$hair_color), decreasing = TRUE))

starwars[1, 1 ]  # show starwars first row in the frist column


# why is NA there?----
# ?is.na----
# shall we remove all NA values or 

starwars %>% 
  filter(is.na(hair_color)) %>% tibble() # look for patterns are they associated with other variables?

starwars %>% 
  filter(is.na(hair_color)) %>% View()

class(starwars$height)
summary(starwars$height) # but his doesn't tell you the shape of the data
boxplot(starwars$height)
hist(starwars$height) # this also tells us if the data is normally distributed!!

# clean data----
