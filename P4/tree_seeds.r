Loblolly$Seed <- factor(Loblolly$Seed)
seeds <- levels(Loblolly$Seed)
n <- length(levels(Loblolly$Seed))
data_split <- split(Loblolly, Loblolly$Seed)

# dataframe vector for results
seed <- character(0)
intercept <- numeric(0)
slope <- numeric(0)

for (i in 1:n){
  tree_model <- lm(height~age, data_split[[i]])
  seed <- c(seed, seeds[i])
  intercept <- c(intercept, tree_model$coefficients[1])
  slope <- c(slope, tree_model$coefficients[2])
}


trees <- data.frame("Seed" = seed, "Intercept" = intercept, "Slope" = slope)
trees # dataframe containing slopes and intercepts for each seed
