# More Functional Programming + Basic Statistics in R
# https://devsify.ai/sessions/s04_more_functional/

v1 <- c(1,2,3,4,5,17)
print(v1)

# Everything is a vector, even a single numerical value:
a <- 5
print(a)

# Recycling:
v1 <- 5
v2 <- c(2,3,4)
print(v1 + v2)
## [1] 7 8 9

# Be careful:
v1 <- c(1,2)
v2 <- c(2,3,4)
print(v1 + v2)
## Warning in v1 + v2: longer object length is not a multiple of shorter object length

# Recycling and mean()
v1 <- c(1,2,3)
print(mean(v1))
## 2

v2 <- c(2,3,4)
print(mean(v2))
## [1] 3

# Do not forget about NA values when using mean():
v1 <- c(1,NA)
v2 <- c(2,3,4)
print(mean(v1) + mean(v2))
## [1] NA

# Huh. Use na.rm=TRUE
v1 <- c(1,NA)
v2 <- c(2,3,4)
print(mean(v1, na.rm=TRUE) + mean(v2, na.rm=TRUE))
## [1] 4

# And always use na.rm=TRUE when you are unsure whether you will, or will not have to deal with missing values in your data.
# Let’s introduce all of the most important descriptive statistics in R: load the mtcars data and inspect w. summary(): 
data(mtcars)
summary(mtcars)

# Let’s focus on the mpg column for a moment:
summary(mtcars$mpg)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   10.40   15.43   19.20   20.09   22.80   33.90

# Do we have any NAs in mtcars$mpg?
sum(is.na(mtcars$mpg))
## [1] 0

# No. Let’s go over statistics, one by one. Minimum, min():
min(mtcars$mpg)
## [1] 10.4

# Maximum, max():
max(mtcars$mpg)
## [1] 33.9

# The median is the middle value in an ordered set of numbers. To find it, you first sort the data from smallest to largest:
# If there is an odd number of values in the dataset, the median is the single middle value.
# If there is an even number of values, the median is the average (mean) of the two middle values.

# Median, med():
median(mtcars$mpg)
## [1] 19.2

# Q1 (First Quartile): This is the value that marks the 25th percentile of a dataset, meaning 25% of the data values lie below Q1
# and 75% lie above it.

# Q3 (Third Quartile): This is the value that marks the 75th percentile of a dataset, meaning 75% of the data values lie below Q3
# and 25% lie above it.

# IQR (Interquartile Range): This is a measure of the spread of the middle 50% of the data. It is calculated as:
  # IQR=Q3−Q1.

# Introducing the quantile() function, p=.25 for Q1:
quantile(mtcars$mpg, p = .25)

##    25% 
## 15.425
