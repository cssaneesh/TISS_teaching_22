
plants <- read.csv("fruiting_plants.csv")

library(tidyverse)

glimpse(fruiting_plants)

# View(plants)
names(plants) %>% tibble()

# let us clean column titles

library(janitor)

plants <- plants %>% clean_names() # %>% view()

names(plants) %>% tibble()

# If you want use clean_names later save it 

# view(plants)


library(stringr)

#plants <- plants %>% 
  mutate(common_name = ifelse(str_detect(common_name, "^[:upper:]+$"), 
                              common_name, str_to_title(common_name)))

# plants <- plants %>% 
    mutate(demand_in_the_market = ifelse(str_detect(demand_in_the_market, "^[:upper:]+$"), 
                                         demand_in_the_market, str_to_title(demand_in_the_market)))  

plants <- plants %>% 
  mutate(have_you_seen_this_plant = ifelse(str_detect(have_you_seen_this_plant, "^[:upper:]+$"), 
                                           have_you_seen_this_plant, str_to_title(have_you_seen_this_plant)))
  
View(plants)

# recode----

# if you notice height it is dbl but not clean first

plants %>% select(scientific_name )

# the way scientific names are written is as follows: Homo sapiens, Panthera tigris, Elephas maximus

plants <- plants %>% mutate(scientific_name=recode(scientific_name,'Prunusavium'= 'Prunus avium'))%>% 
  view()

# plants <- plants %>% mutate(scientific_name=recode(scientific_name,'Ficuscarica'= 'Ficus carica')) %>% view()

# plants <- plants %>% mutate(scientific_name=recode(scientific_name,'Vitis Vinifera'= 'Vitis vinifera')) %>% view()

# It is good to have some variables as factors
is.factor(plants$demand_in_the_market)

plants$have_you_seen_this_plant <- as.factor(plants$have_you_seen_this_plant)

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
  


