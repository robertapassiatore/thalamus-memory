################### BEHAVIORAL ANALYSIS ###################
#load packages 
library(rstatix)
library(stats)

#import dataset from a text file in the Environment R section
data <- behavioral_dataset_thal  #change with your dataset file name
str(data)  #check class of the features

### PERFORM BEHAVIORAL ANALYSIS ###

#Shapiro-Wilk test on the two indices 
range(data$PERF_HIT, na.rm = TRUE)
range(data$PERF_CR, na.rm = TRUE)
shapiro.test(data$PERF_HIT) #on associative memory index
shapiro.test(data$PERF_CR)   #on correct rejection index

#Wilcoxon signed rank test comparing the two response types
MWa=wilcox.test(data$PERF_HIT, data$PERF_CR, paired = TRUE, exact = FALSE)
Za = qnorm(MWa$p.value/2) #Z-score of the V-value computed performing Wilcoxon signed rank test
wilcox_effsize(data, PERF_TOT ~ RESPONSE_TYPE, paired = TRUE) #computing the effect-size

#Wilcoxon signed rank test on the RTs based on the two different response types
MWb=wilcox.test(data$RT_HITS, data$RT_CR, paired=TRUE)
Zb = qnorm(MWb$p.value/2) #Z-score of the V-value computed performing Wilcoxon signed rank test
wilcox_effsize(data, RT_TOT ~ RESPONSE_TYPE, paired = TRUE) #computing the effect-size

#Wilcoxon rank sum test (or Mann-Whitney) for indipendent samples
MWe = wilcox.test(data$PERF_HIT_RUB, data$PERF_HIT_UNIBA, paired = FALSE)  #comparing the two associative memory indices of the two samples
Ze = qnorm(MWe$p.value/2) #Z-score of the W-value computed performing Wilcoxon rank sum test
wilcox_effsize(data, ASSOC_INDEX ~ SITE, paired = FALSE) #computing the effect-size

#evaluate the association between age, sex, IQ, educational level and associative memory index
lm <- lm(PERF_HIT ~ age, data=data)
summary(lm)
lm <- lm(PERF_HIT ~ sex, data=data)
summary(lm)
lm <- lm(PERF_HIT ~ IQ, data=data)
summary(lm)
lm <- lm(PERF_HIT ~ education, data=data)
summary(lm)
