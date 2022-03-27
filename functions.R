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

time(11.10)

# mean fuction----
my_mean <- function(x){
  sum(x)/length(x)
}

my_mean(x)
