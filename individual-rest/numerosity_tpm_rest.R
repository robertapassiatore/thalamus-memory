############### NUMEROSITY FOR NON-ZERO OCCURRENCES AND TWO-PART MODEL ############### 

######################################################################################
#####              CHECK FOR NUMEROSITY ABOUT NON-ZERO OCCURRENCES             #######
######################################################################################

#import the dataset from a text file in the Environment R section
data_tot <- dataset_resting_state  #change with your dataset file name
str(data_tot)  #check the class of the features

# Create a list for labels of Network and Side variables in your dataset
networks <- c("DMN", "LFPN", "RFPN")
sides <- c("L", "R")

# List to store the results of zero occurrences for each thalamic subdivision within each network and group by side
occurrences_results <- list()

# Create a for loop for each network and side
for (network in networks) {
  for (side in sides) {
    # Select the data frame corresponding to the current network and side
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # check for numerosity of non-zero values for each thalamic subdivision
    # pre-encoding resting-state 
    occurrences_pos <- list(
      Anterior.pre = current_data %>%
        filter(Anterior.pre > 0) %>%
        summarise(occurrences = n()),
      Medial.pre = current_data %>%
        filter(Medial.pre > 0) %>%
        summarise(occurrences = n()),
      Ventral.pre = current_data %>%
        filter(Ventral.pre > 0) %>%
        summarise(occurrences = n()),
      Posterior.pre = current_data %>%
        filter(Posterior.pre > 0) %>%
        summarise(occurrences = n()),
      # post-encoding resting-state
      Anterior.post = current_data %>%
        filter(Anterior.post > 0) %>%
        summarise(occurrences = n()),
      Medial.post = current_data %>%
        filter(Medial.post > 0) %>%
        summarise(occurrences = n()),
      Ventral.post = current_data %>%
        filter(Ventral.post > 0) %>%
        summarise(occurrences = n()),
      Posterior.post = current_data %>%
        filter(Posterior.post > 0) %>%
        summarise(occurrences = n())
    )
    
    # Store results in the occurrences_results list
    occurrences_results[[paste(network, side, sep = "_")]] <- occurrences_pos
  }
}

# View results of non-zero occurrences for each thalamic subdivision grouped by side within each network
print(occurrences_results)

################################################################################
################         TWO-PART MODEL - RESTING-STATE ANALYSES    ############
################################################################################

# load library
library(ggplot2)
library(topmodel)
library(Hmisc)
library(twopartm)


###### PRE-ENCODING RESTING STATE 
# take into account only lm for thalamic subdivisions with N>10 non-zero occurrences
# Function to calculate the natural logarithm with an offset to avoid negative values
log_with_offset <- function(x) {
  log(x - min(x) + 1) + 0.00000000000001
}

########### DMN ########### 
# Create a list for labels of Network (DMN) and side (Left and Right) variables in your dataset
networks <- c("DMN")
sides <- c("L","R")



# Create a for loop for each network and side
for (network in networks) {
  for (side in sides) {
    # Select the data frame corresponding to the network and side of interest
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # Operations for two-part models for each thalamic subdivision
    subdivisions <- c("Anterior", "Medial", "Ventral", "Posterior")
    for (subdivision in subdivisions) {
      # Data distribution plot
      ggplot(current_data, aes_string(x = paste0(subdivision, ".pre"))) + 
        geom_histogram(aes(y = ..density..), color = "black", fill = "white") +
        geom_density(alpha = .2, fill = "#FF6666") +
        xlim(-100, 100) + 
        theme_classic()
      
      # Shapiro-Wilk test of normality
      shapiro_test_result <- shapiro.test(current_data[[paste0(subdivision, ".pre")]])
      print(paste("Shapiro-Wilk test for", subdivision, "thalamic subdivision:", shapiro_test_result$p.value))
      
      # Natural logarithmic transformation of the thalamic subdivision
      current_data$logSubdivision <- log_with_offset(current_data[[paste0(subdivision, ".pre")]])
      # Compute a dichotomic variable indicating whether thalamic recruitment is equal to zero (0) or not (1) 
      current_data$null <- ifelse(current_data[[paste0(subdivision, ".pre")]] == 0, 0, 1)
      
      # Fit the two-part models
      tpmodel <- tpm(Perf ~ null + logSubdivision + Age + Sex + Hand, 
                     data = current_data, 
                     link_part1 = "logit", 
                     family_part2 = gaussian(link = "identity"))
      
      print(summary(tpmodel))
    }
  }
}

########### LFPN ########### 
# Create a list for labels of Network (LFPN) and side (Left and Right) variables in your dataset
networks <- c("LFPN")
sides <- c("L", "R")

# Create a for loop for each network and side
for (network in networks) {
  for (side in sides) {
    # Select the dataframe corresponding to the network and side of interest
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # Operations for two-part models for each thalamic subdivision
    subdivisions <- c("Anterior", "Medial", "Ventral", "Posterior")
    for (subdivision in subdivisions) {
      # Data distribution plot
      ggplot(current_data, aes_string(x = paste0(subdivision, ".pre"))) + 
        geom_histogram(aes(y = ..density..), color = "black", fill = "white") +
        geom_density(alpha = .2, fill = "#FF6666") +
        xlim(-100, 100) + 
        theme_classic()
      
      # Shapiro-Wilk test of normality
      shapiro_test_result <- shapiro.test(current_data[[paste0(subdivision, ".pre")]])
      print(paste("Shapiro-Wilk test for", subdivision, "thalamic subdivision:", shapiro_test_result$p.value))
      
      # Natural logarithmic transformation of the thalamic subdivision
      current_data$logSubdivision <- log_with_offset(current_data[[paste0(subdivision, ".pre")]])
      # Compute a dichotomic variable indicating whether thalamic recruitment is equal to zero (0) or not (1) 
      current_data$null <- ifelse(current_data[[paste0(subdivision, ".pre")]] == 0, 0, 1)
      
      # Fit the two-part models
      tpmodel <- tpm(Perf ~ null + logSubdivision + Age + Sex + Hand, 
                     data = current_data, 
                     link_part1 = "logit", 
                     family_part2 = gaussian(link = "identity"))
      
      print(summary(tpmodel))
    }
  }
}

########### RFPN ########### 
# Create a list for labels of Network (RFPN) and side (Left and Right) variables in your dataset
networks <- c("RFPN")
sides <- c("L", "R")


# Create a for loop for each network and side
for (network in networks) {
  for (side in sides) {
    # Select the dataframe corresponding to the network and side of interest
    current_data <- data_tot[intersect(which(data_tot$Side == side), which(data_tot$Network == network)), ]
    
    # Operations for two-part models for each thalamic subdivision
    subdivisions <- c("Anterior", "Medial", "Ventral", "Posterior")
    for (subdivision in subdivisions) {
      # Data distribution plot
      ggplot(current_data, aes_string(x = paste0(subdivision, ".pre"))) + 
        geom_histogram(aes(y = ..density..), color = "black", fill = "white") +
        geom_density(alpha = .2, fill = "#FF6666") +
        xlim(-100, 100) + 
        theme_classic()
      
      # Shapiro-Wilk test of normality
      shapiro_test_result <- shapiro.test(current_data[[paste0(subdivision, ".pre")]])
      print(paste("Shapiro-Wilk test for", subdivision, "thalamic subdivision:", shapiro_test_result$p.value))
      
      # Natural logarithmic transformation of the thalamic subdivision
      current_data$logSubdivision <- log_with_offset(current_data[[paste0(subdivision, ".pre")]])
      # Compute a dichotomic variable indicating whether thalamic recruitment is equal to zero (0) or not (1) 
      current_data$null <- ifelse(current_data[[paste0(subdivision, ".pre")]] == 0, 0, 1)
      
      # Fit the two-part models
      tpmodel <- tpm(Perf ~ null + logSubdivision + Age + Sex + Hand, 
                     data = current_data, 
                     link_part1 = "logit", 
                     family_part2 = gaussian(link = "identity"))
      
      print(summary(tpmodel))
    }
  }
}

