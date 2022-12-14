#Øvelser kap 2 i læreboka

#2.4

height<- c(170, 176, 182, 175, 187)
weight<- c(55, 67, 76, 83, 70)

hw_data <- data.frame(height, weight)

#2.5
x<- 1:5
x<- 5:1
x<-c(1:5,4:1)

#Eksempler

# Compute the correlation between the variables age and purchase
age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)
cor(age, purchase)

#Pearson er følsom for utliggere, bruker spearman

cor(age, purchase, method = "spearman")


#Exercise2.6 Using the data you created in Exercise 2.4, do the following:
#Compute the mean height of the people.
mean(height)
#Compute the correlation between height and weight.
cor(height, weight, method = "spearman")

#Exercise 2.7 Do the following:
#Read the documentation for the function length. What does it do? 
#Apply it to your height vector.
?length
length(height)


#Read the documentation for the function sort. What does it do? 
#What does the argument decreasing (the values of which can be either FALSE or TRUE) do? 
#Apply the function to your weight vector
?sort
sort(weight,decreasing = FALSE)

#Exercise 2.8 Compute the following:
  
sqrt(pi)

exp(2) * log(4)
#Exercise 2.9 R will return non-numerical answers if you try to perform computations 
#where the answer is infinite or undefined. Try the following to see some possible results
1/0
0/0
sqrt(-1)


library(ggplot2)
msleep
View(msleep)

#nyttige funksjoner
head(msleep)
tail(msleep)
dim(msleep)
str(msleep)
names(msleep)

data(msleep)

##numeriske data

summary(msleep)

#sleep_rem  
#Min.   :0.100
#1st Qu.:0.900
#Median :1.500
#Mean   :1.875
#3rd Qu.:2.400
#Max.   :6.600
#NA's   :22

#hente ut en variable
msleep$sleep_total

# examples of functions that can be used to compute descriptive statistics for this vector are:S
mean(msleep$sleep_total)      # Mean
median(msleep$sleep_total)    # Median
max(msleep$sleep_total)       # Max
min(msleep$sleep_total)       # Min
sd(msleep$sleep_total)        # Standard deviation
var(msleep$sleep_total)       # Variance
quantile(msleep$sleep_total)  # Various quantiles

#To see how many animals sleep for more than 8 hours a day, we can use the following
sum(msleep$sleep_total > 8)   # Frequency (count)
mean(msleep$sleep_total > 8)  # Relative frequency (proportion)

mean(msleep$sleep_rem)
#is NA because there is NA values in sleep_rem vector
# instead, we use
mean(msleep$sleep_rem, na.rm = TRUE)

#same problem with correlation
cor(msleep$sleep_total, msleep$sleep_rem)

# now we use "use = "complete.obs" "
cor(msleep$sleep_total, msleep$sleep_rem, use = "complete.obs")

## Categorical data
table(msleep$vore)
#proportions
proportions(table(msleep$vore))

#table function:
# Counts:
table(msleep$vore, msleep$conservation)

# Proportions, per row:
proportions(table(msleep$vore, msleep$conservation),
            margin = 1)

# Proportions, per column:
proportions(table(msleep$vore, msleep$conservation),
            margin = 2)

View(diamonds)
str(diamonds)
summary(diamonds)

## Plotting numerical data
library(ggplot2)
ggplot(msleep, aes(x = sleep_total, y = sleep_rem)) + geom_point()

plot(msleep$sleep_total, msleep$sleep_rem, pch = 16)
grid()

#Exercise 2.11 Create a scatterplot with total sleeping time along the x-axis and 
#time awake along the y-axis (using the msleep data). 
#What pattern do you see? Can you explain it?
library(ggplot2)
ggplot(msleep, aes(x = sleep_total, y = awake)) + geom_point()

#titles using x and y lab
ggplot(msleep, aes(sleep_total, sleep_rem)) +
  geom_point() +
  xlab("Total sleep time (h)")

ggplot(msleep, aes(sleep_total, sleep_rem)) +
  geom_point(colour = "red") +
  xlab("Total sleep time (h)")

#You can run colors() in the Console to see a list of the 657 colours
#that have names in R (examples of which include "papayawhip", 
#"blanchedalmond", and "cornsilk4"), or use colour hex codes like "#FF5733".

colors()

ggplot(msleep, aes(sleep_total, sleep_rem, colour = vore)) +
  geom_point() +
  xlab("Total sleep time (h)")

#continous variable
ggplot(msleep, aes(sleep_total, sleep_rem, colour = sleep_cycle)) +
  geom_point() +
  xlab("Total sleep time (h)")

#Exercise 2.12
ggplot(diamonds, aes(carat, price, colour = cut)) +
  geom_point() +
  xlab("Weight of the diamond(carat)") +
  ylab("Price(USD)")

ggplot(diamonds, aes(carat, price, colour = cut)) +
  geom_point(alpha = 0.25) +
  xlab("Weight of the diamond(carat)") +
  ylab("Price(USD)")

#Exercise 2.13
ggplot(diamonds, aes(carat, price, shape = cut)) +
  geom_point() +
  xlab("Weight of the diamond(carat)") +
  ylab("Price(USD)")

ggplot(diamonds, aes(carat, price, size = x)) +
  geom_point() +
  xlab("Weight of the diamond(carat)") +
  ylab("Price(USD)")
##
ggplot(msleep, aes(brainwt, sleep_total, colour = vore)) + 
  geom_point() +
  xlab("Brain weight") +
  ylab("Total sleep time")
# plottet viser noen utliggere som vi kan ta vekk med å bestemme grensene for 
# x-aksen

ggplot(msleep, aes(brainwt, sleep_total, colour = vore)) + 
  geom_point() +
  xlab("Brain weight") +
  ylab("Total sleep time") +
  xlim(0,1.5)

#bedre, men prøver med log
ggplot(msleep, aes(log(brainwt), sleep_total, colour = vore)) + 
  geom_point() +
  xlab("log(Brain weight)") +
  ylab("Total sleep time")

#tilslutt, lage logskala på x-aksen

ggplot(msleep, aes(brainwt, sleep_total, colour = vore)) + 
  geom_point() +
  xlab("Brain weight (logarithmic scale)") +
  ylab("Total sleep time") +
  scale_x_log10()

#Exercise 2.14
ggplot(msleep, aes(log(bodywt), log(brainwt), colour = sleep_total)) + 
  geom_point() +
  xlab("log(Body weight)") +
  ylab("log(Brain weight)")

# facetting -  i.e. to create a grid of plots corresponding to the different groups.

ggplot(msleep, aes(brainwt, sleep_total)) + 
  geom_point() +
  xlab("Brain weight (logarithmic scale)") +
  ylab("Total sleep time") +
  scale_x_log10() +
  facet_wrap(~ vore)

#Exercise 2.15
ggplot(diamonds, aes(carat, price)) + 
  geom_point() +
  xlab("carat") +
  ylab("price") +
  facet_wrap(~ cut)

?facet_wrap

ggplot(diamonds, aes(carat, price)) + 
  geom_point() +
  xlab("carat") +
  ylab("price") +
  facet_wrap(~ cut, nrow=5)

# boxplot
# Base R:
boxplot(sleep_total ~ vore, data = msleep)

# ggplot2:
ggplot(msleep, aes(vore, sleep_total)) +
  geom_boxplot()

#Forklaringer på boxplot
#Median: the thick black line inside the box.
#First quartile: the bottom of the box
#Third quartile: the top of the box.
#Minimum: the end of the line (“whisker”) that extends from the bottom of the box.
#Maximum: the end of the line that extends from the top of the box.
#Outliers: observations that deviate too much12 from the rest are shown as separate points. 
#These outliers are not included in the computation of the median, quartiles and the extremes.

#Exercise 2.16
ggplot(diamonds, aes(price,cut)) +
  geom_boxplot(fill = "red")

?geom_boxplot

ggplot(diamonds, aes(price,reorder(cut, price, median))) +
  geom_boxplot(color = "magenta", fill = "red")

ggplot(diamonds, aes(reorder(cut, price), price)) +
  geom_boxplot(colour = "magenta", fill = "turquoise") +
  geom_jitter(size = 0.1, alpha = 0.2)

# Histogram
# Base R:
hist(msleep$sleep_total)

# ggplot2:
ggplot(msleep, aes(sleep_total)) +
  geom_histogram()

#Exercise 2.17
ggplot(diamonds, aes(price)) +
  geom_histogram()

ggplot(diamonds, aes(price)) +
  geom_histogram(color = "black") +
  facet_wrap(~ cut)

## Plotting categorical data

#Bar charts

# Base R
barplot(table(msleep$vore))

# ggplot2
ggplot(msleep, aes(vore)) +
  geom_bar()

#To create a stacked bar chart using ggplot2, we use map all groups to the same
#value on the x-axis and then map the different groups to different colours. 
#This can be done as follows:

ggplot(msleep, aes(factor(1), fill = vore)) +
  geom_bar() 

#Exercise 2.18
ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(width = 0.8, position = "dodge") 
  
# Endrer retning
ggplot(diamonds, aes(cut)) +
  geom_bar() +
  coord_flip()

#To set different colours for the bars, we can use fill, either to set the 
#colours manually or using default colours (by adding a colour aesthetic)

# Set colours manually:
ggplot(diamonds, aes(cut)) +
  geom_bar(fill = c("red", "yellow", "blue", "green", "purple"))

# Use defaults:
ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar()

#control bar width
ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar(width = 0.5)

#By adding fill = clarity to aes we create stacked bar charts:
ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar()

# "dodge" to geom_bar we obtain grouped bar charts:
ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(position = "dodge")
