# functions----

# add a value to a vector
x <- c(8,1,4)
add_vec <- function(add){
  add+10
}

add_vec(x)  
# time conversion to India
time <- function(x){
  x + 3.3
}

time(12.38)

# mean fuction----
my_mean <- function(x){
  sum(x)/length(x)
}

my_mean(x)

library(dplyr)

site_1 <- data.frame(site= rep('site 1', 100) ,tree = rep('teak', 100), 
                     height = rnorm(n = 100, mean = 20))

site_2 <- data.frame(site= rep('site 2', 90), tree = rep('teak', 90), 
                     height = rnorm(n = 90, mean = 14))

data <- bind_rows(site_1, site_2)

library(ggplot2)
plot <- ggplot(data, aes(x=site, y= height))
plot+geom_boxplot()

ggplot(data, aes(sample= height, col= site))+
  stat_qq()+ stat_qq_line()

ggplot(data, aes(height, fill=site))+
  geom_histogram(bins = 90)+ facet_wrap(~site)


t.test(height~site, data= data, var.equal=TRUE)
