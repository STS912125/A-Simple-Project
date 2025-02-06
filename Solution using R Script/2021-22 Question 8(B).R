#Problem I am trying to solve:

#2021-22 Q8(B):

# Three varieties of potatoes are being compared for yield. The experiment is
# conducted by assigning each variety at random to one of 3 equal-size plots at each of
# 4 different locations. The following yields for varieties A, E, and C, in 100 kilograms
# per plot, were recorded:
#   Localion 1 Location 2 Location 3 Location 4
# B: 13 C: 21 C: 9 A: 11
# A: 18 A: 20 B: 12 C: 10
# C: 12 B: 23 A: 14 B: 17
# Perform a randomized complete block analysis of variance to test the hypothesis that
# there is no diffrence in the yielding capabilities of the 3 varieties of potatoes. Use a
# 0.05 level of significance. Draw conclusions.

#First I tried to do this by manually calculating everything..

Location = factor(rep(1:4, times = 3))
Variety = factor(rep(c('A','B','C'), each = 4))

B = c(13,23,12,17)
A = c(18,20,14,11)
C = c(12,21,9,10)
Yield = c(A,B,C)

data = data.frame(Location,Variety,Yield)

SST = var(data$Yield)*(nrow(data)-1)

library(dplyr)

VarietyMean = data %>% group_by(Variety) %>% summarise(`Mean` = mean(Yield))
LocationMean = data %>% group_by(Location) %>% summarise(`Mean` = mean(Yield))

k = nrow(VarietyMean)
b = nrow(LocationMean)

SSA = var(VarietyMean$Mean)*(nrow(VarietyMean)-1)*b

SSB = var(LocationMean$Mean)*(nrow(LocationMean)-1)*k

SSE = SST-SSA-SSB


MSA = SSA/(k-1)
MSB = SSB/(b-1)
MSE = SSE/((k-1)*(b-1))

f_Var = MSA/MSE

alpha = 0.05
fcrit_Var = qf(1-alpha,(k-1),(k-1)*(b-1))

pvalue_Var = 1-pf(f_Var,(k-1),(k-1)*(b-1))

if (f_Var<fcrit_Var){
  cat("there is no diffrence in the yielding capabilities
      of the 3 varieties of potatoes since the calculated f value of",f_Var,
      " is lower the the critical value of ", fcrit_Var,"\nAlso the
      calculated p value of",pvalue_Var,"is not significant at the",alpha,
      "level\n")
}else   cat("there is atl least some diffrence in the yielding capabilities
      of the 3 varieties of potatoes since the calculated f value of",f_Var,
            " is higher the the critical value of ", fcrit_Var,"\nAlso the
      calculated p value of",pvalue_Var,"is significant at the",alpha,
            "level\n")

library(ggplot2)

x = seq(0,10, by = 0.5)
y = df(x, (k-1),(k-1)*(b-1))

pltdata = data.frame(x,y)

 
ggplot(pltdata, aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept = c(f_Var,fcrit_Var), color = c("blue","red"))

#doing this using the built in functions in R

AovModel = aov(Yield ~ Variety + Location, data)

summary(AovModel)

#looking at the values, looks like my manual calculations were correct :)
