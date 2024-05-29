############### NUMEROSITY FOR NON-ZERO OCCURRENCES AND LINEAR MODEL ON THE SWITCH FROM POST- TO PRE-ENCODING RESTING STATE #########

### calculating delta POST-PRE, i.e. change score 

# load library 
library(dplyr)
library(ggplot2)

#import the dataset from a text file in the Environment R section
data_tot <- dataset_resting_state  #change with your dataset file name
str(data_tot)  #check the class of the features

data_tot$Anterior.delta <- (data_tot$Anterior.post - data_tot$Anterior.pre)
data_tot$Medial.delta <- (data_tot$Medial.post - data_tot$Medial.pre)
data_tot$Ventral.delta <- (data_tot$Ventral.post - data_tot$Ventral.pre)
data_tot$Posterior.delta <- (data_tot$Posterior.post - data_tot$Posterior.pre)

str(data_tot)
#positive values indicate an increase in thalamic recruitment from pre-encoding to post-encoding resting-state.
#negative values indicate a decrease in thalamic recruitment from pre-encoding to post-encoding resting-state.

#####################################################################################
################ CHECK FOR NUMEROSITY ABOUT ZERO and NON-ZERO OCCURENCES ############
#####################################################################################

# Create a list for labels of Network and Side variable in your dataset
networks <- c("DMN", "LFPN", "RFPN")
sides <- c("L", "R")

# List to store the results of zero occurrences for each thalamic subdivision within each network and group by side
occurrences_0_results <- list()
occorrenze_pos_neg_results <- list()

# Create a for loop for each network and side
for (network in networks) {
  for (side in sides) {
    # Select the dataframe corresponding to the current network and side
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # check for numerosity of zero values for each thalamic subdivision
    # change score
    # zero occurrences
    occurrences_0 <- list(
      Anterior.delta = current_data %>%
        filter(Anterior.delta == 0) %>%
        summarise(occurrences = n()),
      Medial.delta = current_data %>%
        filter(Medial.delta == 0) %>%
        summarise(occurrences = n()),
      Ventral.delta = current_data %>%
        filter(Ventral.delta == 0) %>%
        summarise(occurrences = n()),
      Posterior.delta = current_data %>%
        filter(Posterior.delta == 0) %>%
        summarise(occurrences = n())
    )
    # total of non-zero occurrences
    occurrences_pos_neg <- list(
      Anterior.delta = current_data %>%
        filter(Anterior.delta != 0) %>%
        summarise(occurrences = n()),
      Medial.delta = current_data %>%
        filter(Medial.delta != 0) %>%
        summarise(occurrences = n()),
      Ventral.delta = current_data %>%
        filter(Ventral.delta != 0) %>%
        summarise(occurrences = n()),
      Posterior.delta = current_data %>%
        filter(Posterior.delta != 0) %>%
        summarise(occurrences = n())
    )
    # Store results in the occurrences_results lists
    occurences_0_results[[paste(network, side, sep = "_")]] <- occurrences_0
    occurrences_pos_neg_results[[paste(network, side, sep = "_")]] <- occurrences_pos_neg
  }
}

# View results of zero and non-zero occurrences for each thalamic subdivision grouped by side within each network
print(occurrences_0_results)
print(occurrences_pos_neg_results)

###########################################
################ LINEAR MODEL #############
###########################################

# compute lm only for thalamic subdivisions with N>10 non-zero occurrences

########### DMN ########### 
# Create a list for labels of Network (DMN) and side (Left and Right) variables in your dataset
networks <- c("DMN")
sides <- c("L", "R")

# for loop for hemispheres and networks
for (network in networks) {
  for (side in sides) {
    # select the corresponding side and network
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # linear model on each thalamic subdivision
    subdivisions <- c("Medial.delta", "Ventral.delta", "Posterior.delta")
    for (subdivision in subdivisions) {
      # model fit
      lm_model <- lm(Perf ~ . + Age + Sex + Hand, data = current_data[, c(subdivision, "Perf", "Age", "Sex", "Hand")])
      
      # display results
      print(summary(lm_model))
    }
  }
}

########### LFPN ########### 
# Create a list for labels of Network (LFPN) and side (Left) variable in your dataset
networks <- c("LFPN")
sides <- c("L")

# for loop for hemispheres and networks
for (network in networks) {
  for (side in sides) {
    # select the corresponding side and network
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # linear model on each thalamic subdivision
    subdivisions <- c("Anterior.delta", "Medial.delta", "Ventral.delta", "Posterior.delta")
    for (subdivision in subdivisions) {
      # model fit
      lm_model <- lm(Perf ~ . + Age + Sex + Hand, data = current_data[, c(subdivision, "Perf", "Age", "Sex", "Hand")])
      
      # display results
      print(summary(lm_model))
    }
  }
}



########### RFPN ########### 
# Create a list for labels of Network (RFPN) and side (Right) variable in your dataset
networks <- c("RFPN")
sides <- c("R")

# for loop for hemispheres and networks
for (network in networks) {
  for (side in sides) {
    # select the corresponding side and network
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # linear model on each thalamic subdivision
    subdivisions <- c("Anterior.delta", "Medial.delta", "Ventral.delta", "Posterior.delta")
    for (subdivision in subdivisions) {
      # model fit
      lm_model <- lm(Perf ~ . + Age + Sex + Hand, data = current_data[, c(subdivision, "Perf", "Age", "Sex", "Hand")])
      
      # display results
      print(summary(lm_model))
    }
  }
}
