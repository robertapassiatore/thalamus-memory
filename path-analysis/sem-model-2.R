## load package
library(lavaan)
library(effectsize)

##### sem baseline resting state to performance through task activity during encoding (m1), retrieval (m2), and post-encoding resting state (m3)
model <- '  # direct effect
              Pre.Medial.FPN ~ d*Perf
            # mediator1 in between
              Task.Anterior ~ a1*Perf
              Pre.Medial.FPN ~ c1*M1 
            # mediator2 in between
              M2 ~ a2*Perf
              Pre.Medial.FPN ~ c2*M2
            # mediator3 in between
              M3 ~ a3*Perf
              Pre.Medial.FPN ~ c3*M3 
            # between mediators M1*
              M2 ~ b1*M1
            # between mediators M1*
              M3 ~ b2*M1
            # between mediators M1*
              M3 ~ b3*M2
            # indirect effect 1 with M1 only in between (a1*c1)
              a1c1 := a1*c1
            # indirect effect 2 with M2 only in between (a2*c2)
              a2c2 := a2*c2
            # indirect effect 3 with M3 only in between (a3*c3)
              a3c3 := a3*c3
            # indirect effect 3 with both M1 and M2 in between (a1*b1*c2)
              a1b1c2:= a1*b1*c2
            # indirect effect 3 with both M1 and M3 in between (a1*b2*c3)
              a1b2c3:= a1*b2*c3
            # indirect effect 3 with both M2 and M3 in between (a2*b3*c3)
              a2b3c3:= a2*b3*c3
            # indirect effect 4 with M1, M2 and M3 in between (a1*b1*b3*c3)
              a1b1b3c3:= a1*b1*b3*c3
            # total effect
              total := d + (a1*c1) + (a2*c2) + (a3*c3) + (a1*b1*c2) + (a1*b2*c3) + (a2*b3*c3) + (a1*b1*b3*c3) '




# Estimate the mediation model
mediation_results <- sem(model, data = data, se = "bootstrap", missing = "ml",
                         bootstrap = 5000, iseed = 1234)
# Summarize the results
#save(mediation_results, file = 'mediation_results.RData')
summary(mediation_results, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
res.med = standardizedSolution(mediation_results)
effect_size = z_to_r(res.med$z, n=mediation_results@Data@nobs[[1]], ci = 0.95)


