#Problem I am trying to solve:

#2021-22 Q7(C):

#Data: The following data were obtained in a study of the relationship between the weight and chest size of infants at birth:

datatext = "Weight	ChestSize
2.75	29.5
2.15	26.3
4.41	32.2
5.52	36.2
3.21	27.2
4.32	27.7
2.31	28.3
4.30	30.3
3.71	28.7"

#(i) Estimate the slope and intercept in a simple linear regression model.
#(ii) Evaluate S2.
#(iii) Find a 99% confidence interval for the average chest size at x=3.5
#(iv) Find a 95% prediction interval at x=3.5
#(v) Calculate r (correlation coefficient).
#(vi) Test the null hypothesis that ρ=0 against the alternative that ρ>0ρ>0 at the 0.01 level of significance.
#(vii) What percentage of the variation in infant chest sizes is explained by differences in weight?

data = read.table(text=datatext,header = TRUE, sep ="\t")

# I will use a fitted model here
#Ybar = B0 +B1*X
#assuming that weight is the independent variable here


#First let's do this using the normal formulation

mean_x = mean(data$Weight)
mean_y = mean(data$ChestSize)

B1_acc_to_formula = sum((data$Weight - mean_x) * (data$ChestSize - mean_y))/sum((data$Weight - mean_x)^2)
B0_acc_to_formula = mean_y - B1* mean_x

#I also could have done this using R's built in linear regression model

model = lm(ChestSize~Weight, data = data)

#apparently it does the same thing that my formula does

B0 = model$coefficients[["(Intercept)"]] #is almost the same as B0
B1 = model$coefficients[["Weight"]] #is almost B1

#let's try plotting this

data$ChestSizeFitted = B0 + B1*data$Weight

library(ggplot2)

ggplot(data, aes(x= Weight))+
  geom_point(aes(y= ChestSize))+
  geom_line(aes(y= ChestSizeFitted))

cat("The slope is ",B1 ,"and intercept is ",B0,"\n")

#Finding s2 or mean squared error
#calculating manually here
s2 = sum(model$residuals^2)/(nrow(data)-2)

cat("S2 is ",s2 ,"\n")


#Now for (iii)...
#Here the question is asking what the confidence interval for y is, at x=3.5.
#in other words, What is the interval where we can say with 99% certainty that the mean/true value of y will fall into that region?
#the point estimator is the y that we get from the model

Y_estimator = B0+B1*3.5
#I will just use the standard formula for standard error here. Or is there an easier way to do this in R?
t_crit = abs(qt((1-0.99)/2,nrow(data)-2))
sxx = sum((data$Weight - mean(data$Weight))^2)
sqr = (3.5 - mean(data$Weight))^2

se_for_conf_int = sqrt(s2 * (1 / nrow(data) + sqr/sxx))

upperBound = Y_estimator + t_crit * se_for_conf_int
lowerBound = Y_estimator - t_crit * se_for_conf_int

cat("99% Confidence Interval for Y:", lowerBound, "to", upperBound, "\n")

#Now lets use some built in R functionality :)

new_data = data.frame(Weight=3.5)

conf_interval_data = predict(model, newdata = new_data, interval = "confidence", level = 0.99, se.fit = TRUE)

UpperBoundR = conf_interval_data$fit[3]
LowerBoundR = conf_interval_data$fit[2]

error1 = abs(upperBound-UpperBoundR)*100/upperBound
error2 = abs(lowerBound-LowerBoundR)*100/lowerBound

cat("Using Built in tool in R the error in boundary calculation turns out to be ",error1,"and ",error2,"respectively\n")


#So using R we can find the confidence interval for a new value of y quite easily

#For Question (iv)...
#We are asked to calculate the prediction interval for x= 3.5
#Which is asking, for x = 3.5, in which interval would a newly predicted value of y fall?(that we are 95% certain of)
#you could do this with a formula or with R just as before

t_critP = abs(qt((1-0.95)/2,nrow(data)-2))
se_for_pred_int = sqrt(s2 * (1+1 / nrow(data) + sqr/sxx))

upperBoundP = Y_estimator + t_critP * se_for_pred_int
lowerBoundP = Y_estimator - t_critP * se_for_pred_int

cat("95% Prediction Interval for Y:", upperBoundP, "to", lowerBoundP, "\n")

#Now lets use some built in R functionality again:)

pred_interval_data = predict(model, newdata = new_data, interval = "prediction", level = 0.95, se.fit = TRUE)

UpperBoundPR = pred_interval_data$fit[3]
LowerBoundPR = pred_interval_data$fit[2]

error3 = abs(upperBoundP-UpperBoundPR)*100/upperBoundP
error4 = abs(lowerBoundP-LowerBoundPR)*100/lowerBoundP

cat("Using Built in tool in R the error in boundary calculation turns out to be ",error3,"and ",error4,"respectively\n")

#Quite handy these built in functions are :)

#(v) calculating r..
#first using formulation
sse = sum(model$residuals^2)
sst = sum((data$ChestSize-mean_y)^2)
r = sqrt(1-sse/sst)

cat("Value of R is = ", r, "\n")

#now for a way to do this in R

r_usingR = cor(data$Weight,data$ChestSize)

error5 = abs(r-r_usingR)*100/r

cat("Using Built in tool in R the error is ",error5,"\n")

#this is just a test