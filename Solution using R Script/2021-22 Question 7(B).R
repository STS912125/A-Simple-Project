#Problem I am trying to solve:

#2021-22 Q7(B):

# A new rocket-launching system is being considered for deployment of small,
# short-range rockets. The existing system has p = 0,8 as the probability of a successful
# launch. A sample of 40 experimental launches is made with the new system, and 34
# are successful.
# (i) Construct a 95% confidence interval for p.
# Would you conclude that the new system is better?

mu = 0.8
n = 40
no_of_succes = 34
p0 = no_of_succes/n
sigma = mu*(1-mu)/n


alpha =0.95
prob = (1-alpha)/2

z_crit = qnorm(prob)

se = abs(z_crit)*sqrt(sigma)

uB = p0 + se
lB = p0 + se

cat("95% Confidence Interval for Y:", lB, "to", uB, "\n")
#Would I conclude if the new system is better?
#H0: p0 = 0.8 same as old
#H1: p0 > 0.8 so it is a one tailed test

#calculating the pvalue

z_calc = (p0-mu)/sqrt(sigma)
p_value = 1-qnorm(abs(z_calc))

#I think its not significant so the new system is not better
if (p_value > alpha)
{
  cat("Hypothesis Accepted Since the calculated P value of ",p_value,"is bigger than the significant value of ",alpha,"\n")
}else
{
  cat("Hypothesis Rejected Since the calculated P value of ",p_value,"is smaller than the significant value of ",alpha,"\n")
}


x = seq(-4,4,by = 0.1)
y = dnorm(x)

pltdata = data.frame(x,y)

ggplot(pltdata,aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept =z_calc ,color= "blue")

#done:)
#didn't put much effort into this one

