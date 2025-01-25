#Problem I am trying to solve:

#2021-22 Q3(D):

#The National Safety Council reported that 52 percent of American tumpike
#drivers are men. A sample of 300 cars traveling southbound on the New Jersey
#Tumpike yesterday revealed that 170 were driven by men. At the .01 significance
#level, can we conclude that a larger proportion of men were driving on the New
#Jersey Tumpike than the national statistics indicate?

mu = 0.52 #null hypothesis

n = 300 #sample size

p = 170/n  #sample proportion

sigma = p*(1-p)/n

z = abs(mu-p)/sqrt(sigma)

alpha = 0.01

significant_probability =1-(alpha)

z_critical = qnorm(significant_probability)

if (z<z_critical)
{
  cat("Hypothesis Accepted Since the calculated Z value of ",z,"is on the left region of the critical z value of ",z_critical,"\n")
  
}else
{
  cat("Hypothesis Rejected Since the calculated Z value of ",z,"is on the right region of the critical z value of ",z_critical,"\n")
}

#lets plot this using ggplot this time

library(ggplot2)

x_values = seq(-4,4,length=100)
y_values = dnorm(x_values)
data = data.frame(x_values, y_values)

ggplot(data, aes(x=x_values,y=y_values))+
  geom_line()+
  geom_vline(xintercept = z_critical,color= "red")+
  geom_vline(xintercept = z,color= "blue")
  
cat("This indicates that there were not a larger proportion of men driving on the New
Jersey Tumpike than the national statistics indicate")
