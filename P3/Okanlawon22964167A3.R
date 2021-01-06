# Question 1
# 0.101 (base 2) = 0.625 (base 10)  // convert base 2 to base 10

# Question 2
# 0.101 (base 10) = 0.0001100111011011... (base 2)  // convert base 10 to base 2

# Question 3
# B is more accurate than A, because it doesn't deal with a huge of values in its calculation, like A does
# i.e. biggest number in A, x^4, is substantially larger than the biggest number in B, x^2

# Question 4
# a) tail(primes, 100)    // print last 100 elements of vector "primes"
# b) sum(primes[1:9000])  // add uip first 9000 elements in vector "primes"

# Question 5
top <- (x^4+y^4)*(x^4-y^4)
bottom <- (196059601*19801*199)
trueVal <- function(x,y) ((top/bottom)-1)*x^16
trueVal(100, 99)
# = 0

# Question 6 // tom & david started working on different dates, how many days difference?
Tom <- "1999-07-05" #format y-m-d
David <- "2003-12-12"
diff(as.Date(c(Tom, David)))
# = Time difference of 1621 days


# Question 7  // create single row matrix and graph it
cities <- c("Ottawa", "Toronto", "London", "Windsor", "Sudbury", "Thunderbay")
famincome <- c(93.07, 66.79, 70.16, 67.22, 75.24, 72.96)
income <- matrix(famincome, nrow = 1)
colnames(income) <- cities
income
#      Ottawa Toronto London Windsor Sudbury Thunderbay
# [1,]  93.07   66.79  70.16   67.22   75.24      72.96
barplot(income, xlab = "Cities", ylab = "Income (in $1000s)", main = "2009 Family Income in Six Cities")
dotchart(income, xlab = "Income (in $1000s)", main = "2009 Family Income in Six Cities", labels = colnames(income))


# Question 8 
EuStockMarkets
# a) // create vectr containing successive differences of the first column
returns1 <- diff(EuStockMarkets[,1])
returns1
# b)
hist(returns1, breaks = "Scott")
hist(returns1, breaks = "Freedman-Diaconis")
# breaks = FD gives smaller binwidths
# c)
# breaks = scott is symmetrically distributed
# breaks = fd is symmetrically dsitributed
