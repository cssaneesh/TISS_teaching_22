# Read each line carefully
# Anything with # symbol in r is for you (only for you, not for r) to understand
# there are questions in the between find answers for those

# Calculator----
# Basic arithmetic operations

# R can be used as a calculator.

# The basic arithmetic operators are:
  
# + (addition)
# - (subtraction)
# * (multiplication)
# / (division)
# and ^ (exponentiation).

# Type directly the command below in the console:
# we ask r to something for us press Run 
# shortcut is control + Enter (windows) Command + Return (Mac)

# Addition on or begining or end of the following line press Run or use shortcuts
3 + 7 
# notice the result appears in the console [1] 10

# Substraction
7 - 3

# Multiplication
3 * 7

# Divison
7/3

# Exponentiation
2^3

# Modulo: returns the remainder of the division of 8/3
8 %% 3

#Note that, in R, I am using '#’ is used for adding comments to explain what the R code is about.

#Basic arithmetic functions

#Logarithms and Exponentials:
x <- 5 # you can change the number and try log2 and others

log2(x) # logarithms base 2 of x
log10(x) # logaritms base 10 of x
exp(x) # Exponential of x

# Trigonometric functions:
  
cos(x) # Cosine of x
sin(x) # Sine of x
tan(x) #Tangent of x
acos(x) # arc-cosine of x
asin(x) # arc-sine of x
atan(x) #arc-tangent of x

# Other mathematical functions

abs(x) # absolute value of x
sqrt(x) # square root of x

# Assigning values to variables-----

# A variable can be used to store a value.


# For example, the R code below will store the price of a lemon in a variable, say “lemon_price”:
  
# Price of a lemon = 2 euros
lemon_price <- 2 # you can change the number
# or use this
lemon_price = 2 # you can change the number

# Note that, it’s possible to use <- or = for variable assignments.

# Note that, R is case-sensitive. This means that lemon_price is different from Lemon_Price.

# To print the value of the created object, just type its name:
  
lemon_price

# or use the function print():
  
print(lemon_price) # here print is the function and lemon_price the object that we made

# R saves the object lemon_price (also known as a variable) in memory. It’s possible to make some operations with it.

# Multiply lemon price by 5
5 * lemon_price

# You can change the value of the object:
  
# Change the value
lemon_price <- 5
# Print again
lemon_price

# The following R code creates two variables holding the width and the height of a rectangle. These two variables will be used to compute of the rectangle.

# Rectangle height
height <- 10
# rectangle width
width <- 5
# compute rectangle area
area <- height*width

# question----
# how to see the result of area?


# The function ls() can be used to see the list of objects we have created:
  
ls()
  
# workspeace----
# The collection of objects currently stored is called the workspace.

# Note that, each variable takes some place in the computer memory. If you work on a big project, it’s good to clean up your workspace.

# To remove a variable, use the function rm():
  
# Remove height and width variable
rm(height, width)
# Display the remaining variables
ls()

# Basic data types----

# Basic data types are numeric, character and logical.

# Numeric object: How old are you?
my_age <- 40
# Character  object: What's your name?
my_name <- "Saneesh"

saneesh <- "parent"
sanusha <- "parent"
appu <- "son"
year <- 1980

sanusha==sanusha# notice the result in the console
saneesh==appu # notice the result in the console
# answers are logical object

# Note that, character vector can be created using double (“) or single (’) quotes. If your text contains quotes, you should escape them using ""

# It’s possible to use the function class() to see what type a variable is:
  
class(my_age)

class(my_name)

# You can also use the functions is.numeric(), is.character(), is.logical() to check whether a variable is numeric, character or logical, respectively. For instance:
  
is.numeric(my_age)
is.character()
is.logical() # try this saneesh==sanusha
is.numeric(my_name)
is.numeric(year)
class(year)
# If you want to change the type of a variable to another one, use the as.* functions, including: as.numeric(), as.character(), as.logical(), etc.

my_age

# Convert my_age to a character variable
as.character(year)

# not rum the following functions
is.numeric(year)
class(year) # notice results in the console


# Note that, the conversion of a character to a numeric will output NA (for not available). R doesn’t know how to convert a numeric variable to a character variable.
# Vectors----

# A vector is a combination of multiple values (numeric, character or logical) in the same object. In this case, you can have numeric vectors, character vectors or logical vectors.


# Create a vector----

# A vector is created using the function c() (for concatenate), as follow:
  
# Store your friends'age in a numeric vector
friend_ages <- c(32, 33, 28, 26) # Create

# how to view friends age, hint print ()


# Store your friend names in a character vector
my_friends <- c("Vinay", "Neeraja", "Anil", "Alankrita")
my_friends 

# Store your friends marital status in a logical vector
# Are they married? (yes/no <=> TRUE/FALSE)
are_married <- c(TRUE, TRUE, TRUE, FALSE)
are_married

It’s possible to give a name to the elements of a vector using the function names().

# Vector without element names
friend_ages

# Vector with element names
names(friend_ages) <- c("Vinay", "Neeraja", "Anil", "Alankrita")
friend_ages

# Note that a vector can only hold elements of the same type. For example, you cannot have a vector that contains both characters and numeric values.

# Find the length of a vector (i.e., the number of elements in a vector)

# Number of friends
length(my_friends)


# Case of missing values----

# I know that some of my friends (Vinay and Anil) have 2 children. But this information is not available (NA) for the remaining friends (Bernard and Jerome).

# In R missing values (or missing information) are represented by NA:
  
have_child <- c(Vinay = NA, Anil = NA, 
                  Neeraja = 'yes', Alankrita = 'yes')
have_child


# It’s possible to use the function is.na() to check whether a data contains missing value. The result of the function is.na() is a logical vector in which, the value TRUE specifies that the corresponding element in x is NA.

# Check if have_child contains missing values
is.na(have_child)

# Note that, there is a second type of missing values named NaN (“Not a Number”). This is produced in a situation where mathematical function won’t work properly, for example 0/0 = NaN.

# Note also that, the function is.na() is TRUE for both NA and NaN values. To differentiate these, the function is.nan() is only TRUE for NaNs.

# Get a subset of a vector----

CSubsetting a vector consists of selecting a part of your vector.

# Selection by positive indexing: select an element of a vector by its position (index) in square brackets

# Select my friend number 2
my_friends[2]

# Select my friends number 2 and 4 
my_friends[c(2, 4)]


# Select my friends number 1 to 3
my_friends[1:3]

# Note that, R indexes from 1, NOT 0. So your first column is at [1] and not [0].

# If you have a named vector, it’s also possible to use the name for selecting an element:
  
friend_ages["Neeraja"]

# Selection by negative indexing: Exclude an element

# Exclude my friend number 2
my_friends[-2]

# Exclude my friends number 2 and 4
my_friends[-c(2, 4)]

# Exclude my friends number 1 to 3
my_friends[-(1:3)]

# Selection by logical vector: Only, the elements for which the corresponding value in the selecting vector is TRUE, will be kept in the subset.

# Select only married friends
my_friends[are_married == TRUE]

# how to find the name of my frind who is not married?

# Friends with age >=27
my_friends[friend_ages >= 29]

my_friends[friend_ages <= 25] # why character(0)


# Friends with age different from 35
my_friends[friend_ages != 35]

# If you want to remove missing data, use this:
  
# Data with missing values

have_child

# Keep only values different from NA (!is.na())
have_child[!is.na(have_child)]

# Or, replace NA value by "NO" and then print
have_child[!is.na(have_child)] <- "NO"

have_child

# Note that, the “logical” comparison operators available in R are:
  
# <  : for less than
# >  : for greater than
# <= : for less than or equal to
# >= : for greater than or equal to
# == : for equal to each other
# != : not equal to each other

# Calculations with vectors----

# Note that, all the basic arithmetic operators (+, -, *, / and ^ ) as well as the common arithmetic functions (log, exp, sin, cos, tan, sqrt, abs, …), described in the previous sections, can be applied on a numeric vector.

# If you perform an operation with vectors, the operation will be applied to each element of the vector. An example is provided below:
  
# My friends' salary in dollars

salaries <- c(2000, 1800, 2500, 3000)
names(salaries) <- c("Vinay", "Neeraja", "Anil", "Alankrita")
salaries

# Multiply salaries by 2
salaries*2

# As you can see, R multiplies each element in the salaries vector with 2.

# Now, suppose that you want to multiply the salaries by different coefficients. The following R code can be used:
  
# create coefs vector with the same length as salaries
coefs <- c(2, 1.5, 1, 3)
# Multiply salaries by coeff
salaries*coefs

# Note that the calculation is done element-wise. The first element of salaries vector is multiplied by the first element of coefs vector, and so on.

# Compute the square root of a numeric vector:
  
my_vector <- c(4, 16, 9, 32,34,23,45,23,76,21,2,13,45,32,76) # my_vector is the name that I choose
# you can give any name
sqrt(my_vector)

# Other useful functions are:
  
max(my_vector) # Get the maximum value of x
min(my_vector) # Get the minimum value of x
# Get the range of x. Returns a vector containing
# the minimum and the maximum of x
range(my_vector) 

length(my_vector) # Get the number of elements in x

sum(my_vector) # Get the total of the elements in x

prod(my_vector) # Get the product of the elements in x

# The mean value of the elements in x
# sum(x)/length(x)
mean(my_vector) 
sd(my_vector) # Standard deviation of x
var(my_vector) # Variance of x
# Sort the element of x in ascending order
sort(my_vector)

# For example, if you want to compute the total sum of salaries, type this:
  
sum(salaries) # salaries is a vector that we created earlier
sum(my_vector) # my_vector is a vector that we created earlier

# Compute the mean of salaries----
  
# what is the range (minimum, maximum) of salaries?----

# Matrices

# A matrix is like an Excel sheet containing multiple rows and columns. It’s used to combine vectors with the same type, which can be either numeric, character or logical. Matrices are used to store a data table in R. The rows of a matrix are generally individuals/observations and the columns are variables.

# Create and naming matrix

# To create easily a matrix, use the function cbind() or rbind() as follow:
  
# Numeric vectors
col1 <- c(5, 6, 7, 8, 9)
col2 <- c(2, 4, 5, 9, 8)
col3 <- c(7, 3, 4, 8, 7)
# Combine the vectors by column
my_data <- cbind(col1, col2, col3)
my_data

# Change rownames
rownames(my_data) <- c("row1", "row2", "row3", "row4", "row5")
my_data # notice the result in the console

# cbind(): combine R objects by columns
# rbind(): combine R objects by rows
# rownames(): retrieve or set row names of a matrix-like object
# colnames(): retrieve or set column names of a matrix-like object

# If you want to transpose your data, use the function t():
  
t(my_data)

# data: an optional data vector
# nrow, ncol: the desired number of rows and columns, respectively.
# byrow: logical value. If FALSE (the default) the matrix is filled by columns, otherwise the matrix is filled by rows.
# dimnames: A list of two vectors giving the row and column names respectively.

# In the R code below, the input data has length 6. We want to create a matrix with two columns. You don’t need to specify the number of rows (here nrow = 3). R will infer this automatically. The matrix is filled column by column when the argument byrow = FALSE. If you want to fill the matrix by rows, use byrow = TRUE.

mdat <- matrix(
  data = c(1,2,3, 11,12,13), # this is data
  nrow = 2, byrow = TRUE, # number of rows
  dimnames = list(c("row1", "row2"), c("C.1", "C.2", "C.3"))) # names of rows and columns
  
mdat

# Dimensions of a matrix

# The R functions nrow() and ncol() return the number of rows and columns present in the data, respectively.

ncol(my_data) # Number of columns

nrow(my_data) # Number of rows


dim(my_data) # Number of rows and columns

# Get a subset of a matrix

# Select rows/columns by positive indexing

# rowsC and/or columns can be selected as follow: my_data[row, col]

# Select row number 2
my_data[2, ]

# Select row number 2 to 4
my_data[2:4, ]


# Select multiple rows that aren't contiguous
# e.g.: rows 2 and 4 but not 3
my_data[c(2,4), ]

# Select column number 3
my_data[, 3]

# Select the value at row 2 and column  3
my_data[2, 3]

Select by row/column names

# Select column 2
my_data[, "col2"]

# Select by index and names: row 3 and olumn 2
my_data[3, "col2"]

# Exclude rows/columns by negative indexing

# Exclude column 1
my_data[, -1]

# Selection by logical: In the R code below, we want to keep only rows where col3 >=4:
  
col3 <- my_data[, "col3"] # any time you use <- we we arr assigning sometime to r
my_data[col3 >= 4, ]


# Calculations with matrices----

# It’s also possible to perform simple operations on matrice. For example, the following R code multiplies each element of the matrix by 2:

print(my_data)    
my_data*2 # we multiplied all valuse in my_data with 2

# Now if we print we will not see the updated result why?
print(my_data)  # this is the old value

# Or, compute the log2 values:
  
log2(my_data)

# rowSums() and colSums() functions: Compute the total of each row and the total of each column, respectively.

# Total of each row
rowSums(my_data)

# Total of each column
colSums(my_data)

# If you are interested in row/column means, you can use the function rowMeans() and colMeans() for computing row and column means, respectively.

# Note that, it’s also possible to use the function apply() to apply any statistical functions to rows/columns of matrices.

# The simplified format of apply() is as follow:
  
# apply(X, MARGIN, FUN)

# X: your data matrix
# MARGIN: possible values are 1 (for rows) and 2 (for columns)
# FUN: the function to apply on rows/columns
# 
# Use apply() as follow:
  
# Compute row means
apply(my_data, 2, mean)

# Compute row medians
apply(my_data, 1, median)

# Compute column means
apply(my_data, 2, mean)

# Factors----

# Factor variables represent categories or groups in your data. The function factor() can be used to create a factor variable.

# Create a factor----

# Create a factor variable
friend_groups <- factor(c(1, 2, 1, 2))
friend_groups # notice Levels: 1 2

# The variable friend_groups contains two categories of friends: 1 and 2. In R terminology, categories are called factor levels.

# It’s possible to access to the factor levels using the function levels():
  
# Get group names (or levels)
levels(friend_groups)

# we can change levels from 1 and 2 to tall and short
levels(friend_groups) <- c("tall", "short")
friend_groups

# If you want a different order in the levels, you can specify the levels argument in the factor function as follow.

# Change the order of levels
friend_groups <- factor(friend_groups, 
                        levels = c("short", "tall"))
# Print
friend_groups

# Note that:
  
# The function is.factor() can be used to check whether a variable is a factor. Results are TRUE (if factor) or FALSE (if not factor)
# The function as.factor() can be used to convert a variable to a factor.

# Check if friend_groups is a factor
is.factor(friend_groups)

# Check if "are_married" is a factor
is.factor(are_married)

# Convert "are_married" as a factor
as.factor(are_married)

# Calculations with factors----

# If you want to know the number of individuals in each levels, use the function summary():
  
summary(friend_groups)

# In the following example, I want to compute the mean salary of my friends by groups. The function tapply() can be used to apply a function, here mean(), to each group.

# Salaries of my friends
salaries

# Friend groups
friend_groups

# Compute the mean salaries by groups
mean_salaries <- tapply(salaries, friend_groups, mean)
mean_salaries # what do you think of being tall?

# Compute the size/length of each group
tapply(salaries, friend_groups, length)

# It’s also possible to use the function table() to create a frequency table, also known as a contingency table of the counts at each combination of factor levels.

table(friend_groups)

# Cross-tabulation between 
# friend_groups and are_married variables
table(friend_groups, are_married)

# Data frames----

# A data frame is like a matrix but can have columns with different types (numeric, character, logical). Rows are observations (individuals) and columns are variables.

# Create a data frame

# A data frame can be created using the function data.frame(), as follow:
  
# Create a data frame
  friends_data <- data.frame(
    name = my_friends,
    age = friend_ages,
    height = c(180, 170, 185, 169),
    married = are_married)
# Print
friends_data
# To check whether a data is a data frame, use the is.data.frame() function. Returns TRUE if the data is a data frame:
  
is.data.frame(friends_data)

is.data.frame(my_data)

# The object “friends_data” is a data frame, but not the object “my_data”. We can convert-it to a data frame using the as.data.frame() function:
  
# What is the class of my_data? --> matrix
class(my_data)

# Convert it as a data frame
my_data2 <- as.data.frame(my_data)
# Now, the class is data.frame
class(my_data2)

# As described in matrix section, you can use the function t() to transpose a data frame:
  
t(x= friends_data )

# Subset a data frame----

# To select just certain columns from a data frame, you can either refer to the columns by name or by their location (i.e., column 1, 2, 3, etc.).

# Positive indexing by name and by location

# Access the data in 'name' column
# dollar sign is used
friends_data$name

# use names () to see the column names of a data frame
names(friends_data)
# how to acess age in the friends_data?
# or use this
friends_data[, 'name']

# Subset columns 1 and 3
friends_data[ , c(1, 3)]

# Negative indexing

# Exclude column 1
friends_data[, -1]

# Index by characteristics

# We want to select all friends with age >= 27.

# Identify rows that meet the condition
friends_data$age >= 27

# TRUE specifies that the row contains a value of age >= 27.

# Select the rows that meet the condition
friends_data[friends_data$age >= 27, ]

# The R code above, tells R to get all rows from friends_data where age >= 27, and then to return all the columns.

# If you don’t want to see all the column data for the selected rows but are just interested in displaying, for example, friend names and age for friends with age >= 27, you could use the following R code:
  
# Use column locations
friends_data[friends_data$age >= 27,  c(1, 2)]

# Or use column names
friends_data[friends_data$age >= 27, c("name", "age")]

# If you’re finding that your selection statement is starting to be inconvenient, you can put your row and column selections into variables first, such as:
  
age27 <- friends_data$age >= 27
cols <- c("name", "age")

# Then you can select the rows and columns with those variables:
  
friends_data[age27, cols]

# It’s also possible to use the function subset() as follow.

# Select friends data with age >= 27
subset(friends_data, age >= 27)

# Extend a data frame

# Add new column in a data frame

# Add group column to friends_data
friends_data$group <- friend_groups
friends_data

# It’s also possible to use the functions cbind() and rbind() to extend a data frame.

cbind(friends_data, group = friend_groups)

# Calculations with data frame----

# With numeric data frame, you can use the function rowSums(), colSums(), colMeans(), rowMeans() and apply() as described in matrix section.
# Lists----

# A list is an ordered collection of objects, which can be vectors, matrices, data frames, etc. In other words, a list can contain all kind of R objects.

# Create a list----

# Create a list
my_family <- list(
  mother = "Veronique", 
  father = "Michel",
  sisters = c("Alicia", "Monica"),
  sister_age = c(12, 22))
# Print
my_family

# Names of elements in the list
names(my_family)
my_family$mother
my_family$father
my_family$sisters
my_family$sister_age

# Number of elements in the list
length(my_family)
