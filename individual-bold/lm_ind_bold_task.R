############### MULTIPLE LINEAR REGRESSIONS - BOLD SIGNAL - INDIVIDUAL-LEVEL ANALYSIS ############### 

setwd("~/Documents/YourFolder")
df_pos = read.table('YourDf.txt', header = T)
df_pos = df_pos[!is.na(df_pos$Task.Anterior),] ### remove NAs

###### ENCODING CON - LEFT

data = df_pos[which(df_pos$Contrast=='E_hit+-_num'),] ### select the contrast of interest, i.e., encoding
data = data[which(data$Side=='L'),] ### select the side of interest 
data$Sex = as.factor(data$Sex)

###### store results into a data frame
res = data.frame()
m = lm(Perf ~ scale(Task.Anterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[1,1] = r
res[1,2] = rsq2se(r,28)
res[1,3] = 'Anterior'
res[1,4] = 'L'
res[1,5] = 'Encoding\nHits > Control'
res[1,6] = summary(m)$coefficients[2,4]
res[1,7] = t
m = lm(Perf ~ scale(Task.Medial)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[2,1] = r
res[2,2] = rsq2se(r,28)
res[2,3] = 'Medial'
res[2,4] = 'L'
res[2,5] = 'Encoding\nHits > Control'
res[2,6] = summary(m)$coefficients[2,4]
res[2,7] = t
m = lm(Perf ~ scale(Task.Ventral)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[3,1] = r
res[3,2] = rsq2se(r,28)
res[3,3] = 'Ventral'
res[3,4] = 'L'
res[3,5] = 'Encoding\nHits > Control'
res[3,6] = summary(m)$coefficients[2,4]
res[3,7] = t
m = lm(Perf ~ scale(Task.Posterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[4,1] = r
res[4,2] = rsq2se(r,28)
res[4,3] = 'Posterior'
res[4,4] = 'L'
res[4,5] = 'Encoding\nHits > Control'
res[4,6] = summary(m)$coefficients[2,4]
res[4,7] = t


###### ENCODING CON - RIGHT

data = df_pos[which(df_pos$Contrast=='E_hit+-_num'),]
data = data[which(data$Side=='R'),]
data$Sex = as.factor(data$Sex)
#
m = lm(Perf ~ scale(Task.Anterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[5,1] = r
res[5,2] = rsq2se(r,28)
res[5,3] = 'Anterior'
res[5,4] = 'R'
res[5,5] = 'Encoding\nHits > Control'
res[5,6] = summary(m)$coefficients[2,4]
res[5,7] = t
m = lm(Perf ~ scale(Task.Medial)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[6,1] = r
res[6,2] = rsq2se(r,28)
res[6,3] = 'Medial'
res[6,4] = 'R'
res[6,5] = 'Encoding\nHits > Control'
res[6,6] = summary(m)$coefficients[2,4]
res[6,7] = t
m = lm(Perf ~ scale(Task.Ventral)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[7,1] = r
res[7,2] = rsq2se(r,28)
res[7,3] = 'Ventral'
res[7,4] = 'R'
res[7,5] = 'Encoding\nHits > Control'
res[7,6] = summary(m)$coefficients[2,4]
res[7,7] = t
m = lm(Perf ~ scale(Task.Posterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[8,1] = r
res[8,2] = rsq2se(r,28)
res[8,3] = 'Posterior'
res[8,4] = 'R'
res[8,5] = 'Encoding\nHits > Control'
res[8,6] = summary(m)$coefficients[2,4]
res[8,7] = t

###### RETRIEVAL CON - LEFT

data = df_pos[which(df_pos$Contrast=='R_hit+-_num'),] ### select the contrast of interest, i.e., retrieval
data = data[which(data$Side=='L'),]
data$Sex = as.factor(data$Sex)

######
m = lm(Perf ~ scale(Task.Anterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[9,1] = r
res[9,2] = rsq2se(r,28)
res[9,3] = 'Anterior'
res[9,4] = 'L'
res[9,5] = 'Retrieval\nHits > Control'
res[9,6] = summary(m)$coefficients[2,4]
res[9,7] = t
m = lm(Perf ~ scale(Task.Medial)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[10,1] = r
res[10,2] = rsq2se(r,28)
res[10,3] = 'Medial'
res[10,4] = 'L'
res[10,5] = 'Retrieval\nHits > Control'
res[10,6] = summary(m)$coefficients[2,4]
res[10,7] = t
m = lm(Perf ~ scale(Task.Ventral)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[11,1] = r
res[11,2] = rsq2se(r,28)
res[11,3] = 'Ventral'
res[11,4] = 'L'
res[11,5] = 'Retrieval\nHits > Control'
res[11,6] = summary(m)$coefficients[2,4]
res[11,7] = t
m = lm(Perf ~ scale(Task.Posterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[12,1] = r
res[12,2] = rsq2se(r,28)
res[12,3] = 'Posterior'
res[12,4] = 'L'
res[12,5] = 'Retrieval\nHits > Control'
res[12,6] = summary(m)$coefficients[2,4]
res[12,7] = t


###### RETRIEVAL CON - RIGHT 

data = df_pos[which(df_pos$Contrast=='R_hit+-_num'),]
data = data[which(data$Side=='R'),]
data$Sex = as.factor(data$Sex)

m = lm(Perf ~ scale(Task.Anterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[13,1] = r
res[13,2] = rsq2se(r,28)
res[13,3] = 'Anterior'
res[13,4] = 'R'
res[13,5] = 'Retrieval\nHits > Control'
res[13,6] = summary(m)$coefficients[2,4]
res[13,7] = t
m = lm(Perf ~ scale(Task.Medial)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[14,1] = r
res[14,2] = rsq2se(r,28)
res[14,3] = 'Medial'
res[14,4] = 'R'
res[14,5] = 'Retrieval\nHits > Control'
res[14,6] = summary(m)$coefficients[2,4]
res[14,7] = t
m = lm(Perf ~ scale(Task.Ventral)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[15,1] = r
res[15,2] = rsq2se(r,28)
res[15,3] = 'Ventral'
res[15,4] = 'R'
res[15,5] = 'Retrieval\nHits > Control'
res[15,6] = summary(m)$coefficients[2,4]
res[15,7] = t
m = lm(Perf ~ scale(Task.Posterior)+Age+Sex+Hand, data=data)
t=summary(m)$coefficients[2,3]
df= summary(m)$df[2]
r=t2r(t,df)
res[16,1] = r
res[16,2] = rsq2se(r,28)
res[16,3] = 'Posterior'
res[16,4] = 'R'
res[16,5] = 'Retrieval\nHits > Control'
res[16,6] = summary(m)$coefficients[2,4]
res[16,7] = t
colnames(res) = c('R','se', 'Subdivision','Side','Contrast','pval','t')
res$Site = 'RUB'

res$pval.adj[1:4]=p.adjust(res$pval[1:4], method = "BH", n = 4)
res$pval.adj[5:8]=p.adjust(res$pval[5:8], method = "BH", n = 4)
res$pval.adj[9:12]=p.adjust(res$pval[9:12], method = "BH", n = 4)
res$pval.adj[13:16]=p.adjust(res$pval[13:16], method = "BH", n = 4)
res$ci = res$se*1.96

#res.all = rbind(res,res.uniba.R) ### bind df with other results 

p=ggplot(res.all, aes(Subdivision, R)) +
  geom_errorbar(
    aes(ymin = R-ci, ymax = R+ci, color = Site),
    position = position_dodge(0.5), width = 0.2)+
  geom_point(aes(color = Site), position = position_dodge(0.5)) +
  geom_hline(yintercept=0, linetype='dashed', col = 'red') + 
  xlab("Subdivisions") + ylab("Linear model estimates - r") +
  guides(color=guide_legend(title="Samples")) +
  theme_minimal() + ylim(-1,1) + theme(axis.text.x = element_text(angle = 45)) +
  scale_color_manual(values = c("#00AFBB","mediumorchid3")) +
  facet_wrap(vars(Side, Contrast), nrow = 1)

# Create the plot
setwd("~/Documents/YourFolder")
pdf("plot_individual_bold_task_H+_p_ci.pdf", onefile = TRUE, width = 8, height = 5)
p 

dev.off()

# write results into a csv file
write.csv(res.all, file = 'res_all_individual_bold_task_H+_p_ci.csv')

