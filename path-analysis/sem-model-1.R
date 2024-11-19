## load package
library(lavaan)
library(effectsize)

##### sem baseline resting state to performance through task activity during encoding (m1) and retrieval (m2)
model <- '  # direct effect
              Pre.Medial.FPN ~ d*Perf + Age + Sex + Hand + bin
            # mediator1 in between
              Task.Anterior ~ a1*Perf + Age + Sex + Hand
              Pre.Medial.FPN ~ c1*Task.Anterior 
            # mediator2 in between
              Task.Medial ~ a2*Perf + Age + Sex + Hand
              Pre.Medial.FPN ~ c2*Task.Medial
            # between mediators M1*
              Task.Medial ~ b1*Task.Anterior 
            # indirect effect 1 with M1 only in between (a1*c1)
              a1c1 := a1*c1
            # indirect effect 2 with M2 only in between (a2*c2)
              a2c2 := a2*c2
            # indirect effect 3 with both M1 and M2 in between (a1*b1*c2)
              a1b1c2:= a1*b1*c2
            # total effect
              total := d + (a1*c1) + (a2*c2) + (a1*b1*c2) '



# Estimate the mediation model
mediation_results <- sem(model, data = data, se = "bootstrap", missing = "ml",
                         bootstrap = 5000, iseed = 1234)
# Summarize the results
#save(mediation_results, file = 'mediation_results.RData')
summary(mediation_results, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
res.med = standardizedSolution(mediation_results)
effect_size = z_to_r(res.med$z, n=mediation_results@Data@nobs[[1]], ci = 0.95)
