# Question 1
# (a) // display the 14th row of data frame
chickwts[14,]
#    weight    feed
# 14    141 linseed

# (b) // display the 7th, 14th and 37th elements of weight column in data frame
chickwts$weight[c(7, 14, 37)]
# 108 141 423

# (c) // extract observations from data frame that correspond to casein
chickwtsCasein <- subset(chickwts, feed == "casein")

# (d) // find average of weights in chichwtsCasein
mean(chickwtsCasein$weight)
# 323.5833

# (e) // create new column Feed where all feed entries are capitalized
chickwts$Feed <- chickwts$feed
levels(chickwts$Feed)[1]<- "Casein"
levels(chickwts$Feed)[2]<- "Horsebean"
levels(chickwts$Feed)[3]<- "Linseed"
levels(chickwts$Feed)[4]<- "Meatmeal"
levels(chickwts$Feed)[5]<- "Soybean"
levels(chickwts$Feed)[6]<- "Sunflower"

# (f) // extract chickwts that contain observations with weight < 240
chick240 <- subset(chickwts, weight < 240)

# (g) // use table function to create vector 
chick240Table <- table(chick240$feed)
barplot(chick240Table)
# -----------------------------------------------------------------------------------------
# Question 2
# (a) // how many observation in the data frame?
length(cuckoos$id)
# 120 observations in the cuckoos dataframe

# (b) // what is length of 27th observation
cuckoos[27,]
# length measurement for 27th observation = 22

# (c) // list elements in 40th row of data frame
cuckoos[40,]
#    length breadth      species id
# 40   22.9    17.2 meadow.pipit 60

# (d) // use levels function to identify types of birds in species factor
levels(cuckoos$species)
# "hedge.sparrow" "meadow.pipit"  "pied.wagtail"  "robin"   "tree.pipit"    "wren"  

# (e) // use levels function to create new factor, where all except meadowpipit are replaced with other
m.pipitFactor <- factor(cuckoos$species)
levels(m.pipitFactor) <- c("other", "meadow.pipit", "other", "other", "other", "other")
summary(m.pipitFactor)
# other meadow.pipit 
#    75           45 

# (f) // create logical vector column in data frame which says true for all meadowpipit and false for other row
cuckoos$m.pipit <- cuckoos$species
cuckoos$m.pipit <- (cuckoos$m.pipit == "meadow.pipit")

# (g) 
# data frame of rows in cuckoos corresponding to meadowpipit
cuckoosMPipit = cuckoos[cuckoos$species == "meadow.pipit",]
cuckoosMPipit
# data frame of rows in cuckoos with all rows except meadowpipit
cuckoosOther = cuckoos[cuckoos$species != "meadow.pipit",]
cuckoosOther

# (h) // data frame containing all rows with length > 23, find average of breadth
cuckoosLongLength = cuckoos[cuckoos$length > 23, ]
mean(cuckoosLongLength$breadth)
# 16.78824