# data----
path <- ('https://raw.githubusercontent.com/cssaneesh/TISS_teaching_22/main/wordcloud_test.csv')
test <- read.csv(path)

# if you want to save the csv file in your drive
# write.csv(test, 'test.csv') # this will create a new csv file in your project directory
# you can open the csv file externally and make changes and read it again
# name <- read.csv("name.csv)

head(test, 3) # community= is just name, N= is also just a name
tail(test, 3)
max(test$N) # copy this number for max.words=

# wordcloud----
library(wordcloud)
par(bg="black") 
set.seed(3)
# before you plot, make sure that the plot window or Plot pane is maximized!! 
# click on the rectangular button on top of the File, Plots, Packages window
wordcloud(words = test$community, freq = test$N, max.words = 92,
          colors = brewer.pal(8, 'Dark2'))

# if the plot doesn't look good restart R from Session tab 
# or press Ctrl+Shift+F10
# then start from loading data :) 
# if you want to change background bg= "black" or other colors do the above, restart
# if you are happy Export> Save as PDF> select PDF Size> change directory if you want
# enjoy and share!!