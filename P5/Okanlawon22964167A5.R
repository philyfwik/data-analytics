# Question 1
sintaylor <- function(x) {
  m <- 9
  sum <- 0
  for (n in 0:m) {
    num <- (-1)^n
    denBrack <- (2*n)+1
    den <- factorial(denBrack)
    sum <- sum + ((num / den) * (x^denBrack))
  }
  sum
}

# Question 2
library(readr)
population <- read_csv("population.csv")
View(population)

CanPop <- data.frame(population$REF_DATE, population$GEO, population$VALUE)
colnames(CanPop) = c("Year", "Province", "Pop")
CanPop

library(lattice)
dotplot(CanPop$Province~CanPop$Pop | factor(CanPop$Year), data = CanPop, xlab = "Population")

# Question 3
library(readr)
murders <- read_csv("murders.csv")
View(murders)

# a)
CanMurders <- data.frame(murders$REF_DATE, murders$GEO, murders$VALUE)
colnames(CanMurders) <- c("Year", "Province", "Murders")
CanMurders

# b)
dotplot(CanMurders$Province~CanMurders$Murders | factor(CanMurders$Year), data = CanMurders, xlab = "Murders")
dotplot(CanMurders$Murders~as.character(CanMurders$Year), data = CanMurders, xlab = "Year", ylab = "Murders")

# c)
CanMurders$MurdersPerCapita <- c(CanMurders$Murders/CanPop$Pop*100000)
dotplot(CanMurders$Province~CanMurders$MurdersPerCapita | factor(CanMurders$Year), data = CanMurders, xlab = "Murders Per Capita")
dotplot(CanMurders$MurdersPerCapita~as.character(CanMurders$Year), data = CanMurders, xlab = "Year", ylab = "Murders Per Capita")

# d)
totM <- aggregate(CanMurders$Murders~Year, CanMurders, sum)
totMPC <- aggregate(CanMurders$MurdersPerCapita~Year, CanMurders, sum)
SumMurders <- data.frame(unique(CanMurders$Year), totM[2], totMPC[2])
colnames(SumMurders) <- c("Year", "Murders", "MurdersPerCapita")
SumMurders

dotplot(SumMurders$Murders~as.character(SumMurders$Year), data = SumMurders, ylab = "Total Murders")
dotplot(SumMurders$MurdersPerCapita~as.character(SumMurders$Year), data = SumMurders, ylab = "Total Murders Per Capita")

# e)
barplot(CanMurders$Murders[CanMurders$Year==2017], names.arg = CanMurders$Province[CanMurders$Year==2017], cex.names = 0.35, las = 2, main = "Murders in 2017")

# f)
barplot(CanMurders$Murders[CanMurders$Year==2018], names.arg = CanMurders$Province[CanMurders$Year==2018], cex.names = 0.35, las = 2, main = "Murders in 2018")
barplot(CanMurders$Murders[CanMurders$Year==2019], names.arg = CanMurders$Province[CanMurders$Year==2019], cex.names = 0.35, las = 2, main = "Murders in 2019")

# g)
Y1 <- matrix(CanMurders$MurdersPerCapita[CanMurders$Year==2017])
colnames(Y1) <- "2017"
Y2 <- matrix(CanMurders$MurdersPerCapita[CanMurders$Year==2018])
colnames(Y2) <- "2018"
Y3 <- matrix(CanMurders$MurdersPerCapita[CanMurders$Year==2019])
colnames(Y3) <- "2019"
CanHomicides <- cbind(Y1, Y2, Y3)
CanHomicides

# Question 4
# a)
source("radon-1.R")
library("MPV")
attach(radon)
model <- lm(measurement~diameter, data = radon)
PRESS(model)
# = 266.6634

# b)
tmodel <- lm(measurement~diameter + time, data = radon)
PRESS(tmodel)
# = 151.6716 ... time model is better -> lower PRESS

# c)
predict(tmodel, data.frame(diameter=0.9, time=1), interval = "prediction")
#  fit      lwr      upr
#  70.73473 65.61045 75.85902
predict(tmodel, data.frame(diameter=0.9, time=4), interval = "prediction")
# fit      lwr      upr
# 76.38473 71.26045 81.50902
detach(radon)

# Question 5
source("mousetumours.R")
xyplot(mousetumours$volume~mousetumours$time | factor(mousetumours$mouse), data = mousetumours, type=c("p", "smooth"), xlab = "time", ylab = "volume")

# Question 6
View(table.b4)
help("table.b4")

m1 <- lm(y~., data = table.b4)
PRESS(m1)
# = 393.492
m2 <- lm(y~x1, data = table.b4)
PRESS(m2)
# = 224.6111
m3 <- lm(y~x1+x8, data = table.b4)
PRESS(m3)
# = 253.9058
m4 <- lm(y~x1+x2, data = table.b4)
PRESS(m4)
# = 224.441
m5 <- lm(y~x1+x5, data = table.b4)
PRESS(m5)
# = 236.814
m6 <- lm(y~x2+x3+x5+x8, data = table.b4)
PRESS(m6)
# = 331.0418
m7 <- lm(y~x2+x3+x5, data = table.b4)
PRESS(m7)
# = 374.1862
m8 <- lm(y~x2+x3+x5+x9, data = table.b4)
PRESS(m8)
# = 422.3961

