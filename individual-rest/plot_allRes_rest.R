Library(ggplot2)

rest_res = read.table(file = 'res_tpm_resting.txt', header = T)
rest_res$R = t2r(rest_res$t,rest_res$N-1)
rest_res$se = rsq2se(rest_res$R,rest_res$N)


p=ggplot(rest_res, aes(Subdivision, R)) +
  geom_errorbar(
    aes(ymin = R-se, ymax = R+se, color = Dataset),
    position = position_dodge(0.5), width = 0.2)+
  geom_point(aes(color = Dataset), position = position_dodge(0.5)) +
  geom_hline(yintercept=0, linetype='dashed', col = 'red') + 
  xlab("Subdivisions") + ylab("GLM estimate - R") +
  guides(color=guide_legend(title="Samples")) +
  theme_minimal() + ylim(-1,1) + theme(axis.text.x = element_text(angle = 45)) +
  scale_color_manual(values = c("#43B284FF", "#0F7BA2FF"))
p + facet_wrap(vars(Network,Side,Session), nrow = 2) 


setwd("~/Documents/Thalamus")
pdf("plot_rest_p.pdf", onefile = TRUE, width = 8, height = 6)
p + facet_wrap(vars(Network,Side,Session), nrow = 2)

dev.off()