#Problem I am trying to solve:

#2020-21 Q6(A):

#The Laboratory for Interdisciplinary Statistical Analysis at Virginia Technique analyzed data 
#on normal woodchucks for the Department of Veterinary Medicine. The variables of interest were 
#body weight in grams and heart weight in grams. It was desired to develop a linear regression 
#equation in order to determine
#if there is a significant linear relationship between heart weight and total body weight.

datatext = "BodyWeight	HeartWeight
4050	11.2
2465	12.4
3120	10.5
5700	13.2
2595	9.8
3640	11.0
2050	10.8
4235	10.4
2935	12.2
4975	11.2
3690	10.8
2800	14.2
2775	12.2
2170	10.0
2370	12.3
2055	12.5
2025	11.8
2645	16.0
2675	13.8"

#Use heart weight as the independent variable and body weight as the dependent variable
#and fit a simple linear regression using the following data. 
#In addition, test the hypothesis H0:β1=0 versus H1:β1≠0

data = read.table(text = datatext, header = TRUE, sep = "\t")

model = lm(BodyWeight~HeartWeight, data)

B0 = model$coefficients[["(Intercept)"]]
B1 = model$coefficients[["HeartWeight"]]



cat("After Fitting, the intercept B0 = ",B0,", and the slope B1 = ",B1,"\n")

# for the hypothesis testing of B1, We could just use the standard formula

sse = sum(model$residuals^2)
df = nrow(data)-2
s = sqrt(sse/df)
sxx = sum((data$HeartWeight-mean(data$HeartWeight))^2)
alpha = 0.05 #assuming
t_crit = (qt(alpha/2,df))


#now..According to the null hypothesis, B1 = 0, so..

t_calc = (B1/(s/sqrt(sxx)))
pvalue = 2*(1-pt(abs(t_calc),df))

if (abs(t_calc) < abs(t_crit))
    {cat("Hypothesis accepted since the calculated t value ",t_calc,
      "is not significant at ",alpha,"level\nAlso the calculated p value ",
      pvalue,"is not significant\n")
}else cat("Null hypothesis rejected")

  

library(ggplot2)

x = seq(-4,4,length=100)
y = dt(x,df)

plot = data.frame(x=x,y=y)

ggplot(plot, aes(x=x,y=y))+
  geom_line()+
  geom_vline(xintercept = t_calc,color="blue")+
  geom_vline(xintercept = c(t_crit,-t_crit),color="red")

#now I wonder there is an easier way to do this in R..
#let's use the summary of the model

modelsummary = summary(model)
coefficients = modelsummary[["coefficients"]]
t_calcR = coefficients["HeartWeight","t value"]
pvalueR = coefficients["HeartWeight","Pr(>|t|)"]

error1 = abs(t_calc-t_calcR)*100/t_calc
error2 = abs(pvalue-pvalueR)*100/t_calc

cat("Using Built in tool in R the error in t and p value turns out to be ",error1,"and ",error2,"respectively\n")