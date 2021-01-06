# Question 1
# a)
area <- Manitoba.lakes$area
elevation <- Manitoba.lakes$elevation
plot(elevation, area, xlab = "elevation", ylab = "area", xlim = c(160, 260), pch =19)
# lake Winnipeg has a significantly larger area than the other lakes, at almost 5x the average size
# b)
lakenames <- as.character(row.names(Manitoba.lakes))
text(x=elevation, y=area, labels = lakenames,adj = c(1.2, 0.8) , cex = 0.6)
# c)
fit <- lm(area ~ elevation, data = Manitoba.lakes)
abline(fit)

# Question 2
Loblolly
height <- Loblolly$height
age <- Loblolly$age
plot(age, height, xlab = "age", ylab = "height")
fit <- lm(height ~ age, data = Loblolly)
abline(fit)

# Question 3
# For the lakes, no because the line is skewed by the outlier Winnipeg, and is heavily dependent on the lake size
# For the tree growth it makes sense, as you can see the consistent and average growth

# Question 4
height <- Loblolly$height
age <- Loblolly$age
Loblolly$seed <- as.numeric(Loblolly$Seed)
plot(age, height, xlab = "age", ylab = "height", pch = Loblolly$seed)
for (i in 1:n) {
  fit <- lm(height~age, data = subset(Loblolly, Loblolly$seed==i))
  abline(fit)
}

# Question 5
par(mfrow=c(1,2))
hist(trees$Slope)
hist(trees$Intercept)

# Question 6
par(mfrow=c(1,1))
plot(trees$Intercept, trees$Slope, xlab = "intercept", ylab = "slope")
fit <- lm(slope~intercept, data = trees)
abline(fit, col='green')
