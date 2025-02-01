#Problem I am trying to solve:

#2021-22 Q4(c):

#he owner of a mail-order catalog would like to compare her sales with the
#geographic distribution of the population. According to the United States Bureau of
#the Census, 21 percent of the population lives in the Northeast, 24 percent in the
#Midwest, 35 percent in the South, and 20 percent in the West. Listed below is a
#breakdown of a sample of 400 orders randomly selected from those shipped last
#month. At the 0.01 significance level, does the distribution of the orders reflect the
#population?
  
datatext ="
Region Frequency
Northeast 68
Midwest 104
South 155
West 73
"
data = read.table(text = datatext, sep = " ",header = TRUE)

data$PercentPopulation = c(.2,.24,.35,.20)

#You have to use a goodness of fit test here

data$expectedFrequency = sum(data$Frequency)*data$PercentPopulation

data$chivar = (data$Frequency-data$expectedFrequency)^2/data$Frequency

chi_calc = sum(data$chivar)

df = nrow(data)-1

alpha = 0.01

chi_crit = qchisq(1-0.01, df)

if (chi_calc<chi_crit){
  cat("the distribution of the orders reflect the population since the calculated chi value of ",chi_calc,
      "is less than the critical chi vaue of ",chi_crit,"at the ",alpha,"significance level\n")
}else cat("the distribution of the orders don't reflect the population since the calculated chi value of ",chi_calc,
          "is greater than the critical chi vaue of ",chi_crit,"at the ",alpha,"significance level\n")

library(ggplot2)

x = seq(0,20,by = 0.1)
y = dchisq(x, df)

pltdata = data.frame(x,y)

ggplot(pltdata,aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept = c(chi_crit, chi_calc),color= c("blue","red"))



