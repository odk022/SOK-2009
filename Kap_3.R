# Checking the type of variable
x <- 6
y <- "Scotland"
z <- TRUE

class(x)
class(y)
class(z)

# checking a vector
numbers <- c(6, 9, 12)
class(numbers)

all_together <- c(x, y, z)
all_together
class(all_together)

# types of tables
# Bookstore example
age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)
bookstore <- data.frame(age, purchase)
View(bookstore)

# Animal sleep data
library(ggplot2)
View(msleep)

# Diamonds data
View(diamonds)

# First, an example of data stored in a matrix:
?WorldPhones
class(WorldPhones)
View(WorldPhones)

# Next, an example of data stored in a data frame:
?airquality
class(airquality)
View(airquality)

# Finally, an example of data stored in a tibble:
library(ggplot2)
?msleep
class(msleep)
View(msleep)

#du kan bytte dataformat
WorldPhonesDF <- as.data.frame(WorldPhones)
class(WorldPhonesDF)

airqualityMatrix <- as.matrix(airquality)
class(airqualityMatrix)

# Exercise 3.1
a <- "A rainy day in Edinburgh"
a <- 'A rainy day in Edinburgh'

#What data types are the sums 1 + 2, 1L + 2 and 1L + 2L?
sum(1+2)
class(sum(1+2))

class(sum(1L + 2))

class(sum(1L + 2L))

"Hello" + 1

FALSE * 2 
TRUE + 1

# 3.2 What do the functions ncol, nrow, dim, names, and row.names return when 
#applied to a data frame?
ncol(diamonds)
nrow(diamonds)
dim(diamonds)
names(diamonds)
row.names(diamonds)

# 3.3 matrise
?matrix
x<- 1:6
matrix(x,nrow= 2,ncol =3)
matrix(x,nrow= 3,ncol =2)

# Extract the Temp vector:
airquality$Temp

# Compute the mean temperature:
mean(airquality$Temp)


#If we want to grab a particular element from a vector, we must use its index
#within square brackets: [index]. The first element in the vector has index 1, 
#the second has index 2, the third index 3, and so on. 
#To access the fifth element in the Temp vector in the airquality data frame, 
#we can use:
airquality$Temp[5]

# First, we check the order of the columns:
names(airquality)
# We see that Temp is the 4th column.

airquality[5, 4]    # The 5th element from the 4th column,
# i.e. the same as airquality$Temp[5]
airquality[5,]      # The 5th row of the data
airquality[, 4]     # The 4th column of the data, like airquality$Temp
airquality[[4]]     # The 4th column of the data, like airquality$Temp
airquality[, c(2, 4, 6)] # The 2nd, 4th and 6th columns of the data
airquality[, -2]    # All columns except the 2nd one
airquality[, c("Temp", "Wind")] # The Temp and Wind columns

#Exercise 3.4
airquality[, 3]
airquality[3, ]

airquality[1:5, ]

#Compute the correlation between the Temp and Wind vectors of airquality 
#without refering to them using $
cor(airquality[, "Wind"], airquality[, "Temp"], method = "spearman")

#Extract all columns from airquality except Temp and Wind
airquality[, -c(3,4)] 

# examples
age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)
bookstore <- data.frame(age, purchase)

# Perhaps there was a data entry error - the second customer was 
# actually 18 years old and not 48. We can assign a new value to that element 
# by referring to it in either of two ways:

bookstore$age[2] <- 18
# or
bookstore[2, 1] <- 18

# endre til mnd:
#bookstore$age <- bookstore$age * 12

# legge til variable
bookstore$visit_length <- c(5, 2, 20, 22, 12, 31, 9, 10, 11)
bookstore

# Exercise 3.5
# 1. Add a new variable rev_per_minute which is the ratio between purchase and the visit length.
bookstore$rev_per_minute <- bookstore$purchase/bookstore$visit_length
bookstore

# 2.Oh no, there’s been an error in the data entry! Replace the purchase amount for
#the 80-year old customer with 16.
bookstore$purchase[6] <- 16
bookstore

#
max(airquality$Temp)

#hvilken dag var maxtemp?
which.max(airquality$Temp)

airquality[which.max(airquality$Temp),]
airquality[which.min(airquality$Temp),]

# betingelser
# alle data evaluert
airquality$Temp > 90

# viser radene med betingelsen oppfylt
airquality[airquality$Temp > 90,]


# Oversikt logiske operatorer og funksjoner
a <- 3
b <- 8

a == b     # Check if a equals b
a > b      # Check if a is greater than b
a < b      # Check if a is less than b
a >= b     # Check if a is equal to or greater than b
a <= b     # Check if a is equal to or less than b
a != b     # Check if a is not equal to b
is.na(a)   # Check if a is NA
a %in% c(1, 4, 9) # Check if a equals at least one of 1, 4, 9

# radene som oppfyller betingelsen 
which(airquality$Temp > 90)

# oppfyller alle betingelsen?
all(airquality$Temp > 90)

any(airquality$Temp > 90)

#hvor mange oppfyller betingelsen?
sum(airquality$Temp > 90)

#andel med temp over 90 grader
mean(airquality$Temp > 90)

# logical operators & (AND), | (OR), and, less frequently, xor (exclusive or, XOR)
a <- 3
b <- 8

# Is a less than b and greater than 1?
a < b & a > 1

# Is a less than b and equal to 4?
a < b & a == 4

# Is a less than b and/or equal to 4?
a < b | a == 4

# Is a equal to 4 and/or equal to 5?
a == 4 | a == 5

# Is a less than b XOR equal to 4?
# I.e. is one and only one of these satisfied?
xor(a < b, a == 4)

# Exercise 3.6
# Which was the coldest day during the period?
which.min(airquality$Temp)
airquality[which.min(airquality$Temp),]

# How many days was the wind speed greater than 17 mph?
sum(airquality$Wind > 17)
# How many missing values are there in the Ozone vector?
sum(is.na(airquality$Ozone))

# How many days are there for which the temperature was below 70 and the wind speed was above 10?
sum(airquality$Temp < 70 & airquality$Wind > 10)

##

# Exercise 3.7
?cut
# The function cut can be used to create a categorical variable from a numerical variable, by dividing 
# it into categories corresponding to different intervals. Reads its documentation and then create a new 
# categorical variable in the airquality data, TempCat, which divides Temp into 
# the three intervals (50, 70], (70, 90], (90, 110]

TempCat <- cut(airquality$Temp, breaks = c(50,70,90,110))
TempCat
table(TempCat)

##
getwd()
imported_data <- read.csv("data/philosophers.csv")
View(imported_data)
str(imported_data)

# åpner filoversikt
imported_data2 <- read.csv(file.choose())

# laste ned fra URL
# Download WHO tuberculosis burden data:
tb_data <- read.csv("https://tinyurl.com/whotbdata")
tb_data
View(tb_data)

# bruke file path
#C:\Users\OddVi\OneDrive\Dokumenter\Studier\SOK-2009\Fra_boka\data\philosophers.csv

# Må endre fordi R bruker backslash
# Windows example 1:
file_path <- "C:/Users/Mans/Desktop/MyData/philosophers.csv"
# Windows example 2:
file_path <- "C:\\Users\\Mans\\Desktop\\MyData\\philosophers.csv"


#
file_path <- "C:/Users/OddVi/OneDrive/Dokumenter/Studier/SOK-2009/Fra_boka/data/philosophers.xlsx"

#
install.packages("openxlsx")

library(openxlsx)
imported_from_Excel <- read.xlsx(file_path)

View(imported_from_Excel)
str(imported_from_Excel)
file.choose()

#Exercise 3.8

file_path <- "C:/Users/OddVi/OneDrive/Dokumenter/Studier/SOK-2009/Fra_boka/data/vas.csv"
vas <- read.csv(file_path, sep = ";",  dec = ",", skip = 4)
View(vas)
str(vas)

# 1.Why are there two variables named X and X.1 in the data frame?
#tomme kolonner. kan fjernes.
vas <- vas[, -c(4,6)]

# 2.What happens if you remove the sep = ";" argument?
vas <- read.csv(file_path, sep = ";", dec = ",", skip = 4)
#feilmelding

# 3.What happens if you instead remove the dec = "," argument?

vas <- read.csv(file_path, sep = ";",  skip = 4)
str(vas)
# komma blir fortsatt desimalskilletegn og variablen blir tekst istedetfor tall.

# 4.What happens if you instead remove the skip = 4 argument? 
# de fire første linjene fjernes. Viktig slik at datasettet starter med variabelnavnene
vas <- read.csv(file_path, sep = ";", dec = ",")

# 5.What happens if you change skip = 4 to skip = 5?
vas <- read.csv(file_path, sep = ";", dec = ",", skip = 5)
# det blir tatt en linje for mye og første rad i datasettet blir overskrift

#Exercise 3.9
# 1.First, set file_path to the path to projects-email.xlsx. Then we can use read.xlsx 
# from the openxlsx package. The argument sheet lets us select which sheet to read:
file_path <- "C:/Users/OddVi/OneDrive/Dokumenter/Studier/SOK-2009/Fra_boka/data/projects-email.xlsx"
library(openxlsx)
emails <- read.xlsx(file_path, sheet = 2)

View(emails)
str(emails)

# 2.To obtain a vector containing the email addresses without any duplicates, we apply unique 
#to the vector containing the e-mail addresses. That vector is called E-mail with a hyphen -. 
#We cannot access it using emails$E-mail, because R will interpret that as email$E - mail, 
#and neither the vector email$E nor the variable mail exist. Instead, we can do one of the following:

unique(emails[,3])
unique(emails$"E-mail")

#Exercise 3.10
# 1.Import the data using read.csv. What does the resulting data frame look like?
file_path <- "C:/Users/OddVi/OneDrive/Dokumenter/Studier/SOK-2009/Fra_boka/data/vas-transposed.csv"
vast <- read.csv(file_path)
dim(vast)
View(vast)

#2. Read the documentation for read.csv. How can you make it read the row 
#names that can be found in the first column of the .csv file?
vast <- read.csv(file_path, row.names = 1)
View(vast)

# 3. The function t can be applied to transpose (i.e. rotate) your data frame. 
# Try it out on your imported data. Is the resulting object what you were looking for? 
# What happens if you make a call to as.data.frame with your data after transposing it?
# t lets us rotate the data into the format that we are used to. If we only apply t though, 
# the resulting object is a matrix and not a data.frame. If we want it to be a data.frame, 
# we must also make a call to as.data.frame:
vas <- t(vast)
class(vas)
View(vas)

vas <- as.data.frame(t(vast))
class(vas)
View(vas)

##
# Exporting data
# Bookstore example
age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)
bookstore <- data.frame(age, purchase)

# Export to .csv:
write.csv(bookstore, "bookstore.csv")

# Export to .xlsx (Excel):
library(openxlsx)
write.xlsx(bookstore, "bookstore.xlsx")

# saving and loading RData
# To save the objects bookstore and age in a .Rdata file, we can use the save function:
save(bookstore, age, file = "myData.RData")

# To save all objects in your environment, you can use save.image:
save.image(file = "allMyData.RData")

# When we wish to load the stored objects, we use the load function:
load(file = "myData.RData")

##
#t-test

# Let’s say that we want to compare the mean sleeping times of carnivores 
# and herbivores, using the msleep data. t.test takes two vectors as input, 
# corresponding to the measurements from the two groups:

library(ggplot2)
carnivores <- msleep[msleep$vore == "carni",]
herbivores <- msleep[msleep$vore == "herbi",]
t.test(carnivores$sleep_total, herbivores$sleep_total)

t.test(carnivores$sleep_total, herbivores$sleep_total,
       conf.level = 0.90,
       alternative = "greater",
       var.equal = TRUE)

##
# fitting a regression model
?mtcars
View(mtcars)

# Let’s have a look at the relationship between gross horsepower (hp) and fuel consumption (mpg):
library(ggplot2)
ggplot(mtcars, aes(hp, mpg)) +
  geom_point()



# The relationship doesn’t appear to be perfectly linear, but nevertheless, 
# we can try fitting a linear regression model to the data. This can be done using lm. 
# We fit a model with mpg as the response variable and hp as the explanatory variable:

m <- lm(mpg ~ hp, data = mtcars)
m
summary(m)

# Check model coefficients:
coef(m)

# Add regression line to plot:
ggplot(mtcars, aes(hp, mpg)) +
  geom_point() + 
  geom_abline(aes(intercept = coef(m)[1], slope = coef(m)[2]),
              colour = "red")

plot(m)

# hvis vi vil legge til variabler:
m2 <- lm(mpg ~ hp + wt, data = mtcars)
summary(m2)

# Exercise 3.11 
#Fit a linear regression model to the mtcars data, 
# using mpg as the response variable and hp, wt, cyl, and am as explanatory variables. 
# Are all four explanatory variables significant?
m4 <- lm(mpg ~ hp + wt + cyl + am, data = mtcars)

summary(m4)
# hp and wt are significant at the 5 % level, but cyl and am are not

## Grouped summaries

# temp for hver mnd
pr_mnd <- aggregate(Temp ~ Month, data = airquality, FUN = mean)
pr_mnd# der første ledd sier at vi skal ha gjennomsnittstemp for hver mnd

#By default, mean returns NA if there are missing values. In airquality, 
#Ozone contains missing values, but when we compute the grouped means the results are not NA:

aggregate(Ozone ~ Month, data = airquality, FUN = mean)

#By default, aggregate removes NA values before computing the grouped summaries.

#
# It is also possible to compute summaries for multiple variables at the 
# same time. For instance, we can compute the standard deviations (using sd) of Temp and Wind, grouped by Month:
aggregate(cbind(Temp, Wind) ~ Month, data = airquality, FUN = sd)

# Kan også bruke aggregate til å telle dagene i månedene
aggregate(Temp ~ Month, data = airquality, FUN = length)

# by
# Another function that can be used to compute grouped summaries is by. 
# The results are the same, but the output is not as nicely formatted. Here’s 
# how to use it to compute the mean temperature grouped by month:
by(airquality$Temp, airquality$Month, mean)

# What makes by useful is that unlike aggregate it is easy to use with functions 
# that take more than one variable as input. If we want to compute the correlation 
# between Wind and Temp grouped by month, we can do that as follows:

names(airquality)  # Check that Wind and Temp are in columns 3 and 4
by(airquality[, 3:4], airquality$Month, cor)


# Exercise 3.12 
#Load the VAS pain data vas.csv from Exercise 3.8. Then do the following:
file_path <- "C:/Users/OddVi/OneDrive/Dokumenter/Studier/SOK-2009/Fra_boka/data/vas.csv"
View(vas)
str(vas)
as.numeric(vas$VAS)
str(vas)

#1. Compute the mean VAS for each patient.

aggregate(VAS ~ ID, data = vas, FUN = mean)
by(vas$VAS, vas$ID, mean)
#2. Compute the lowest and highest VAS recorded for each patient.

#3.Compute the number of high-VAS days, defined as days where the VAS was at least 7, for each patient



