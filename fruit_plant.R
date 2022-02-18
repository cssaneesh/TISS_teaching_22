
plants <- read.csv("fruiting_plants.csv")

View(plants)

library(tidyverse)

glimpse(plants)

# View(plants)
names(plants) %>% tibble()

# clean names----

# let us clean column titles

# install.packages('janitor')

library(janitor)

plants <- plants %>% clean_names()

names(plants) %>% tibble()

# If you want use clean_names later save it 

# view(plants)
# case change----
glimpse(plants)
plants$common_name # notice that some names are in lower case, ideally a name should be in uppercase
plants %>% select(common_name)# notice that some names are in lower case, ideally a name should be in uppercase

# to do this, stringr has a function, install stringr, remove the hash that is before install.package()
# install.packages('stringr') 

library(stringr)
plants <- plants %>% 
  mutate(common_name = ifelse(str_detect(common_name, "^[:upper:]+$"), 
                              common_name, str_to_title(common_name)))

# homework-----

# do the above for demand_in_the_market, 
View(plants) # see if it has changed

# do the above for have_you_seen_this_plant

View(plants) # see if it has changed

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
plants <- plants %>% mutate(height_in_m= recode(height_in_m, 
                                      '40'= 40,
                                      '6'= 6,
                                      "8-10" = 9,
                                      '5-10' =7.5,
                                      '5-10' =7.5,
                                      "More than 10" =10,
                                      "15 to 20"= 17.5,
                                      'upto 11'= 11,
                                      "10 to 12"= 11,
                                      'upto 14'= 14,
                                      "6-25" = 15.5,
                                      "15-20" = 17.5,
                                      "4.5-10"= 7.5,
                                     "upto 30"= 30,
                                     "upto 30"= 30,
                                     "13"= 13, "10"=10
                                      )) 
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

# following is the base r way of converting character as factor
plants$have_you_seen_this_plant <- as.factor(plants$have_you_seen_this_plant)

is.factor(plants$demand_in_the_market)
is.factor(plants$have_you_seen_this_plant)

levels(plants$demand_in_the_market) # because r is case sensitive (upper and lower)
levels(plants$have_you_seen_this_plant)

plants <- plants %>% mutate(demand_in_the_market=toupper(demand_in_the_market))
plants <- plants %>% mutate(have_you_seen_this_plant=toupper(have_you_seen_this_plant))

levels(plants$demand_in_the_market)
levels(plants$have_you_seen_this_plant)

plants <- plants %>% mutate(demand_in_the_market= as.factor(demand_in_the_market))
plants <- plants %>% mutate(have_you_seen_this_plant= as.factor(have_you_seen_this_plant))

levels(plants$demand_in_the_market)
levels(plants$have_you_seen_this_plant)

plants %>% 
    select(common_name)
# toupper(plants$Common.name) %>% view()

plants %>% 
  summarise(height_in_m)

plants %>% arrange(height_in_m) %>% view()

plants %>% group_by(name_of_your_state) %>% 
  count(Common_name)

ggplot(plants, aes(name_of_your_state, fill= Common_name))+
  geom_histogram(stat = "count")

ggplot(plants, aes(Common_name,height_in_m, size=height_in_m, color=Common_name ))+
  geom_point()

ggplot(plants, aes(height_in_m , trunk_circumference_in_m))+
  geom_point()+
  geom_smooth(method = "lm")

ggplot(plants, aes(common_name, Varities, size=number_of_countries))+
  geom_point()+ # i dont think apple is only in xx countries
coord_flip() # typeof(plants$Number.of.countries), re code to a meaningful number

ggplot(plants, aes(x=common_name, y= energy_kcal, fill=number_of_products))+
  geom_bar(stat = "identity")+
  geom_text(aes(label=energy_kcal), vjust=0.5, color="black", size=3) # + coord_flip()

ggplot(plants, aes(x=number_of_countries, y= number_of_products, 
                   col=common_name, size= energy_kcal))+ geom_point()


now we want to know some number i.e
plants %>% select(common_name, number_of_products) %>% filter(number_of_products>5) %>% tibble() 
  


