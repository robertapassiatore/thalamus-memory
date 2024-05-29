library(tidyverse)

## performance differences
stat.test <- data %>% group_by(Side) %>% wilcox_test(Perf ~ cluster)
stat.test$Z = sapply(stat.test$p, znorm)
stat.test$N = rowSums(stat.test[,c(5,6)])
r=NULL
for (i in 1:6) {
  r=c(r, abs(stat.test$Z[i])/sqrt(stat.test$N[i]))
  
}
stat.test$r = r
stat.test


## medial task recruitment during baseline rest differences
stat.test <- data[which(data$Pre.Medial.FPN!=0),] %>% group_by(Side) %>% wilcox_test(Pre.Medial.FPN ~ cluster)
stat.test$Z = sapply(stat.test$p, znorm)
stat.test$N = rowSums(stat.test[,c(5,6)])
r=NULL
for (i in 1:6) {
  r=c(r, abs(stat.test$Z[i])/sqrt(stat.test$N[i]))
  
}
stat.test$r = r
stat.test

## anterior task activation (encoding) differences
stat.test <- data %>% group_by(Side) %>% wilcox_test(Task.Anterior ~ cluster)
stat.test$Z = sapply(stat.test$p, znorm)
stat.test$N = rowSums(stat.test[,c(5,6)])
r=NULL
for (i in 1:6) {
  r=c(r, abs(stat.test$Z[i])/sqrt(stat.test$N[i]))
  
}
stat.test$r = r
stat.test

## medial task activation (retrieval) differences
stat.test <- data %>% group_by(Side) %>% wilcox_test(Task.Medial ~ cluster)
stat.test$Z = sapply(stat.test$p, znorm)
stat.test$N = rowSums(stat.test[,c(5,6)])
r=NULL
for (i in 1:6) {
  r=c(r, abs(stat.test$Z[i])/sqrt(stat.test$N[i]))
  
}
stat.test$r = r
stat.test

### confounders test
data %>% group_by(Side) %>% wilcox_test(edu ~ cluster)
data %>% group_by(Side) %>% wilcox_test(Age ~ cluster)
data %>% group_by(Side) %>% wilcox_test(qi ~ cluster)
chisq.test(data$Sex[which(data$Side=='L')], data$cluster[which(data$Side=='L')], correct=FALSE)
chisq.test(data$Sex[which(data$Side=='R')], data$cluster[which(data$Side=='R')], correct=FALSE)



