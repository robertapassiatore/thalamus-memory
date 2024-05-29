library(tidyverse)
library(ggpubr)
library(factoextra)
library(reshape2)
library(rstatix)
library(bootcluster)


set.seed(1234)

# Use map_dbl to run many models with varying value of k (centers)
df=scale(data[,c(8,9,18,19)]) #select only task activity variables
tot_withinss <- map_dbl(1:10,  function(k){
  clust.m <- kmeans(x = df, centers = k, nstart = 5)
  clust.m$tot.withinss
})

# Generate a data frame containing both k and tot_withinss
elbow_df <- data.frame(
  k = 1:10,
  tot_withinss = tot_withinss
)

# Plot the elbow plot
clust.opt = NbClust(data = df, diss = NULL, distance = "euclidean",
        min.nc = 2, max.nc = 10, method = "kmeans")
res.clust.opt = as.data.frame(table(clust.opt$Best.nc[1,]))
res.clust.opt$Var1 = as.character(res.clust.opt$Var1) ; res.clust.opt$Var1 = as.numeric(res.clust.opt$Var1)
res.clust.opt = res.clust.opt[res.clust.opt$Var1 > 1,]
res.clust.opt = rbind(res.clust.opt,
                          data.frame(Var1 = setdiff(2:10,res.clust.opt$Var1),
                                     Freq = 0))
res.clust.opt$Var1 = factor(res.clust.opt$Var1,levels = c(2:10))
plot.clust.opt = ggplot(res.clust.opt,aes(x = Var1, y  = Freq)) + geom_bar(stat = "identity") + 
  theme_bw() + ggtitle("NbClust's optimal number of clusters") +
  xlab("Number of Clusters") + theme_pubclean(base_size = 30)
plot.clust.opt

elbow = ggplot(elbow_df, aes(x = k, y = tot_withinss)) +
  geom_line() + geom_point(size=5)+ylab("Sum of squared distances") +xlab('Values of k')+
  geom_vline(xintercept = 3, colour="darkcyan", linetype = "longdash", size=1)+
  scale_x_continuous(breaks = 1:10)+ theme_pubclean(base_size = 30)
elbow

plot1 =  plot.clust.opt+elbow + plot_layout(widths = c(2, 1), guides = "collect")
plot1 #clustering performance plot evaluation


######################### RIGHT ###############################
df=scale(data[which(data$Side=='R'),c(8,9)])
set.seed(1234)
km.out <- kmeans(df, centers = 3, nstart = 5, iter.max = 5000) 
km.out
data$cluster=NA
data$cluster[which(data$Side=='R')] <- km.out$cluster
r.stability = stability(df, k = 3, B=5000, r=5, scheme_2 = TRUE)
r.stability[[4]] = rep(2, length(r.stability$obs_wise))
r.stability[[4]][which(r.stability[[2]]>0.9)] = 1
r.stability[[4]][which(r.stability[[2]]<0.8)] = 3
data$stability= NA
data$stability[which(data$Side=='R')] = as.factor(r.stability[[4]])

######################### LEFT ###############################
df=scale(data[which(data$Side=='L'),c(8,9)])
set.seed(1234)
km.out <- kmeans(df, centers = 3, nstart = 5, iter.max = 5000)
km.out
data$cluster[which(data$Side=='L')] <- km.out$cluster
l.stability = stability(df, k = 3, B=5000, r=5, scheme_2 = TRUE)
l.stability[[4]] = rep(2, length(r.stability$obs_wise))
l.stability[[4]][which(r.stability[[2]]>0.9)] = 1
l.stability[[4]][which(r.stability[[2]]<0.8)] = 3
data$stability[which(data$Side=='L')] = as.factor(l.stability[[4]])

### recode cluster names
data$cluster[which(data$cluster=='A')] <- 1
data$cluster[which(data$cluster=='B')] <- 2
data$cluster[which(data$cluster=='C')] <- 3

data$cluster=as.character(data$cluster)
data$cluster=as.factor(data$cluster)
data$stability=as.character(data$stability)
data$stability=as.factor(data$stability)

### plot clusters
clust.test <- ggplot(data, aes(x=Task.Anterior, y=Task.Medial, color=cluster, shape = cluster)) +
  geom_point(size=5) + stat_ellipse(type  = "norm",level = 0.95) + 
  scale_color_brewer(palette="Dark2")  + 
  scale_shape_discrete(guide = "none") +
  theme_pubclean(base_size = 30) +   facet_wrap(~ Side) +
  ylab('Medial Subdivision\nRetrieval BOLD signal') + xlab('Anterior Subdivision\nEncoding BOLD signal') +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "top", panel.spacing = unit(2, "lines"))
clust.test

plot2  =  plot1 / clust.test + plot_annotation(tag_levels = list(c('A.','B.','C.'), '1')) &
  theme(plot.tag = element_text(face = 'bold'))
plot2

# Create the plot
setwd("~/Documents/Thalamus")
pdf("plot_clusters_opt.pdf", onefile = TRUE, width = 20, height = 18)
plot2

dev.off()


#####plot perfomance
perf.test = ggplot(data, aes(x=cluster, y=Perf)) +
  geom_boxplot(notch = T) + 
  geom_dotplot(aes(x=cluster, y=Perf, fill=cluster),
               binaxis='y', stackdir='center',
               stackratio=0.9, dotsize=0.9) +
  scale_fill_brewer(palette="Dark2")  + 
  scale_color_brewer(palette="Dark2")  + 
  theme_pubclean(base_size = 30) + 
  facet_wrap(~ Side, ncol=1) + ylim(0.6,1.1) +
  ylab('Associative Memory Performance') + xlab('Cluster') +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

stat.test <- data %>% group_by(Side) %>% wilcox_test(Perf ~ cluster)
stat.test
stat.test <- stat.test %>% add_xy_position(x = "cluster")
stat.test$y.position = c(1.01708, 1.04770, 1.07832, 1.01708, 1.04770, 1.07832)
znorm <- function(x) {
  value <- qnorm(x/2) 
  return(value)
}
stat.test$Z = sapply(stat.test$p, znorm)
perf.test = perf.test + stat_pvalue_manual(stat.test, label = "p.adj.signif", tip.length = 0.01, size = 8)
perf.test

######## plot baseline medial recruitment in the frontoparietal network
data.pre = data[which(data$Pre.Medial.FPN!=0),]
data.pre$Pre.Medial.FPN = data.pre$Pre.Medial.FPN/100

data.pre.1 <- data_summary(data.pre, varname="Pre.Medial.FPN", 
                    groupnames=c("Side", "cluster"))

pre.test = ggplot(data.pre.1, aes(x=cluster, y=Pre.Medial.FPN, color=cluster)) +
  geom_bar(stat="identity") + 
  facet_wrap(~ Side, ncol=1) + 
  geom_errorbar(aes(ymin=Pre.Medial.FPN-sd, ymax=Pre.Medial.FPN+sd), width=.2,
               position=position_dodge(.9)) +
  scale_fill_brewer(palette="Dark2")  + 
  scale_color_brewer(palette="Dark2")  + 
  theme_pubclean(base_size = 30) + ylim(0,1.3) +
  xlab('Cluster') + ylab('% of signficant voxels\nMedial subdivisions') +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")
pre.test

stat.test <- data.pre %>% group_by(Side) %>% wilcox_test(Pre.Medial.FPN ~ cluster)
stat.test
stat.test <- stat.test %>% add_xy_position(x = "cluster")
stat.test$y.position = c(1.030, 1.14, 1.26, 1.030, 1.14, 1.26)
pre.test = pre.test + stat_pvalue_manual(stat.test, label = "p.adj.signif", tip.length = 0.01, size = 8)
pre.test

data.melt = melt(data[,c(8,9)])
data.melt$cluster = rep(data$cluster, 2)
data.melt$side = rep(data$Side, 2)
data.melt$variable = ifelse(data.melt$variable=='Task.Anterior','Anterior Subdivision - Encoding','Medial Subdivision - Retrieval')
data.melt$variable = as.factor(data.melt$variable)
p.test = ggplot(data.melt, aes(x = cluster,y = value)) +
  geom_boxplot(notch = T) + 
  geom_dotplot(aes(x=cluster, y=value, fill=cluster),
               binaxis='y', stackdir='center',
               stackratio=0.9, dotsize=0.9) +
  facet_wrap(.~side+variable, labeller = function (labels) {
    labels <- lapply(labels, as.character)
    a <-  do.call(paste, c(labels, list(sep = ",")))
    list(gsub("\\,"," ",a))
  }) +
  scale_fill_brewer(palette="Dark2")  + 
  scale_color_brewer(palette="Dark2")  + 
  theme_pubclean(base_size = 30) + 
  ylim(-4,7) + 
  ylab('BOLD signal') + xlab('Cluster') +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

stat.test <- data.melt %>% group_by(side,variable) %>% wilcox_test(value ~ cluster)
stat.test
#stat.test <- stat.test %>% add_xy_position(x = "cluster")
stat.test$y.position = c(4.9, 5.6, 6.3, 4.9, 5.6, 6.3, 4.9, 5.6, 6.3, 4.9, 5.6, 6.3)
p.test = p.test + stat_pvalue_manual(stat.test, label = "p.adj.signif", tip.length = 0.01, size = 8)
p.test

####combine plot for figure 9
plot3 =  perf.test + pre.test + p.test + plot_layout(widths = c(1, 1, 4), guides = "collect") + 
  plot_annotation(tag_levels = list(c('A.','B.','C.'), '1')) &
  theme(plot.tag = element_text(face = 'bold'))
plot3

# Create the plot
setwd("~/Documents/Thalamus")
pdf("plot_cluster_fig9.pdf", onefile = TRUE, width = 30, height = 18)
plot3

dev.off()

