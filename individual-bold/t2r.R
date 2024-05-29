## In a linear regression model, 
## the conversion between t-statistic and partial r-squared
t2r = function(t, df) {
  sign(t)*sqrt(t^2/(t^2+df))
}

## Fisher’s r-to-z transformation 
r2z = function(r) {
  1/2 * log((1 + r)/(1 - r))
} 

## computation of standar error from r-squared and n
rsq2se = function(r, n) {
  sqrt((1-r^2)/(n-2))
}