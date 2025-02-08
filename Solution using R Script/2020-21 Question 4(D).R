#Problem I am trying to solve:

#2020-21 Q4(D):

# The Gibbs Baby Food Company wishes to compare the weight gain of infants using
# their brand versus their competitors. A sample of 40 babies using the Gibbs products
# revealed a mean weight gain of 7.6 pounds in the first three months after birth. The
# standard deviation of the sample was 2.3 pounds. A sample of 55 babies using the
# competitors brand revealed a mean increase in weight of 8.1 pounds, with a standard
# deviation of 2.9 pounds. At the 0.05 significance level, can we conclude that babies
# using the Gibbs brand gained less weight? Compute the p-value and interpret it.

#assuming the population variances to be equal..

s1 = 2.3
n1 = 40
mu1 = 7.6

s2 = 2.9
n2 = 55
mu2 = 8.1

sp = sqrt(((n1-1)*s1**2 + (n2-1)*s2**2)/(n1 + n2 -2))


#H0 : mu1-mu2 >= 0 
#H1 : mu1-mu2 < 0

tcrit = qt(0.05, n2+n1-2)

tcalc = (mu1 -mu2)/(sp * sqrt(1/n1 + 1/n2))

if (tcalc>tcrit)
{
  cat("Null Hypothesis Accepted, gibbs didn't gain less\n")
  
}else
{
  cat("Hypothesis Rejected,gibbs gained less\n")
}
library(ggplot2)

x = seq(-4,4,by = 0.1)
y = dt(x, n1 + n2 -2)

pltdata = data.frame(x,y)

ggplot(pltdata,aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept = c(tcrit, tcalc),color= c("blue","red"))

pvalue = pt(tcalc,n1 + n2 -2)
cat("the p value of", pvalue, "does reinforce the acceptance of the null hypothesis\n")