############### MULTIPLE LINEAR REGRESSIONS - BOLD SIGNAL - GROUP-LEVEL ANALYSIS ############### 

#load package
library(stats)

#import dataset from a text file in the Environment R section
data <- bold_signal_thal_complete  #change with your dataset file name
str(data)  #check class of the features

#scale the averaged BOLD signal
data_scaled <- as.data.frame(scale(data[,6:11])) #scaling only columns of interest: signal_enc_L, signal_enc_R, signal_ret_L, signal_ret_R, signal_CR_L, signal_CR_R
data <- cbind(data, data_scaled) #combine your complete dataset and the dataset with z-BOLD-signal to perform multiple regressions
str(data)

# Create an empty list to store linear regression results
results <- list()

# For loop to run multiple linear regression for each of the six variables
for (variable in c("z.signal_enc_L", "z.signal_enc_R", "z.signal_ret_L", "z.signal_ret_R", "z.signal_CR_L", "z.signal_CR_R")) {
  # Compute linear regression
  model <- lm(formula = as.formula(paste("perf ~", variable, "+ age + sex + hand")), data = data)
  
  # Recording results in a list
  results[[variable]] <- summary(model)
}

# Displaying results
for (variable in names(results)) {
  cat("Results of the regression for", variable, ":\n")
  print(results[[variable]])
}