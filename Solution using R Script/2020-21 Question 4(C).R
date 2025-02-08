#Problem I am trying to solve:

#2020-21 Q4(C):

# According to a recent survey, Americans get a mean of 7 hours of sleep per night. A
# random sample of 50 students at West Virginia University revealed the mean number
# of hours slept last night was 6.8 hours. The standard deviation of the sample was 0.9
# hours. At the 0.05 significance level, is it reasonable to conclude that the students at
# West Virginia sleep less than the typical American? Compute the p-value.

#Null hypothesis: mean is more than or equal to 7
tcrit = qt(0.05,50-1)

tcalc = (6.8-7)/(0.9/sqrt(50))

if (tcalc>tcrit)
{
  cat("Null Hypothesis Accepted, students sleep about the same\n")
  
}else
{
  cat("Hypothesis Rejected, students sleep less\n")
}
library(ggplot2)

x = seq(-4,4,by = 0.1)
y = dt(x, 50-1)

pltdata = data.frame(x,y)

ggplot(pltdata,aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept = c(tcrit, tcalc),color= c("blue","red"))

pvalue = pt(tcalc,50-1)

cat("but the low p value of", pvalue, "does suggest the rejection of the null hypothesis\n")
