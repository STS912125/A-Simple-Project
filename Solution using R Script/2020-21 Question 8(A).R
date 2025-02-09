#Problem I am trying to solve:

#2020-21 Q8(A):

# The data in the following table represent the number of hours of relief provided by
# five different brands of headache tablets administered to 25 subject experiencing fevers
# of 38°C or more. Perform the analysis of variance and test the hypothesis at the 0.05
# level of significance that the mean number of hours of relief provided by the tablets is
# the same for all five brands. Discuss the results.
text = "A B C D E
5.2 9.1 3.2 2.4 7.1
4.7 6.0 5.8 3.4 6.6
8.1 8.2 2.2 4.1 9.3
6.2 6.0 3.1 1.0 4.2
3.0 9.1 7.2 4.0 7.6"

data = read.csv(text = text, header = TRUE, sep = " ")
n = nrow(data)
k = ncol(data)
alpha = 0.05
fcrit = qf(1-alpha, k-1, k*(n-1))

datamean = c(mean(data$A),mean(data$B),mean(data$C),mean(data$D),mean(data$E))
gmean = mean(datamean)
sst = sum((data-gmean)**2)
ssa = sum((datamean-gmean)**2)*n
sse =sst-ssa

msa = ssa/(k-1)
mse = sse/(k*(n-1))

fcalc = msa/mse

if (fcalc<fcrit)
{
  cat("Null Hypothesis Accepted, about the same for each brand\n")
  
}else
{
  cat("Null Hypothesis Rejected, some difference in mean exists\n")
}
library(ggplot2)

x = seq(0,20,by = 0.1)
y = df(x, k-1, k*(n-1))

pltdata = data.frame(x,y)

ggplot(pltdata,aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept = c(fcrit, fcalc),color= c("blue","red"))

pvalue = 1- pf(fcalc,k-1, k*(n-1))

cat("The low p value of", pvalue, "does reinforce the rejection of the null hypothesis\n")




