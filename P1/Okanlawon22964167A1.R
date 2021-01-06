# Question 1
# (a)
11 * 11 #code
# = 121 (answer)
# (b)
11 * 111
# = 1221
# (c)
11 * 1111
# = 12221
# (d)
11 * 11111
# = 122221
# (e)
# I predict (11 * 1111111111111111111) = 12222222222222222221
# (f)
options(digits = 15)
11 * 1111111111111111111
# = 12222222222222223360
# I think R is right, as the pattern could have exceptions, or a limit
#--------------------------------------------------------------------------------
# Question 2
# (a) // 1 mile  = 1760 yard, convert rivers to miles
riversYards <- rivers * 1760
# (b) // extract first 10 observations
riversYards[0:10]
# 1293600  563200  572000  689920  922240  792000 2567840  237600  818400 1056000
# (c) // display first 5 observations as barplot
barplot(rivers[0:5])
# No, the observations are not in decreasing order
#(d)  // sort observations in decreasing order
Rivers <- sort(rivers, decreasing = TRUE)
barplot(Rivers[0:10])
# 4 rivers in North America are longer than 2000 miles
#--------------------------------------------------------------------------------
# Question 3
# (a) // create function converting celsius to fahrenheit
C2F <- function(x) (1.8*x)+32 # converts x degrees celsius to fahrenheit
# (b)
C2F(1:100) # displays all the conversions to fahrenheit for (1:100) degree celsius
# the 66th observation displays 150.8 degrees fahrenheit, which is closer to 150 than the 65th observation of 149.0
# therefore, the celsius equivalent to 150 degrees fahrenheit is 66 degrees celsius
# (c) // create vector containing, then print output of vector applied to function
Ctemps <- c(-40, 0, 30, 100)
C2F(Ctemps)
# -40  32  86 212
#--------------------------------------------------------------------------------
# Question 4
# create funciton to convert inches to centimeters
inch2cm <- function(x) x*2.54   #cm = inch * 2.54
