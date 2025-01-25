#Problem I am trying to solve:

#2021-22 Q3(C):

#he manufacturer of the X-15 steel-belted radial truck tire claims that the mean
#mileage the tire can be driven before the tread wears out is 60,000 miles. Assume the
#mileage wear follows the normal distribution and the standard deviation of the
#distribution is 5,000 miles. Zisan Truck Company bought 48 tires and found that the
#mean mileage for its trucks is 59,500 miles. Is Zisan's experience different from that
#claimed by the manufacturer at the .05 significance level?

mu = 60000 #mean value of normal distribution under null hypothesis
X = 59000 #computed statistic x
sigma = 5000 #standard deviation of population
n = 48 #sample size
root_n = n ** (1/2)
alpha = 0.05

z = (mu-X)/(sigma/root_n) # Computed Z statistic

#you can compute what the corresponding value would be for a specific cumulative probability under a normal curve in R

cum_prob = 1-(alpha/2)

z_critical = qnorm(cum_prob)

if (z<z_critical)
{
  cat("Hypothesis Accepted Since the calculated Z value of ",z,"is on the left region of the critical z value of ",z_critical,"\n")
  
}else
{
  cat("Hypothesis Rejected Since the calculated Z value of ",z,"is on the right region of the critical z value of ",z_critical,"\n")
}


#We can also calculate the p-value. P value is basically the probability of getting THAT specific Z value, this is easy to do in R

p_value = 1 - pnorm(z)

#It about 0.08292 So the 'Zone' that zisan landed on is wider that the significant region at 0.05

if (p_value > alpha)
{
  cat("Hypothesis Accepted Since the calculated P value of ",p_value,"is bigger than the significant value of ",alpha,"\n")
}else
{
  cat("Hypothesis Rejected Since the calculated P value of ",p_value,"is smaller than the significant value of ",alpha,"\n")
}


#Now What I want to do is try building a plot, to visualize this

x_values = seq(-4,4,length=100)
y_values = dnorm(x_values)
plot(x_values,y_values)
abline(v=z,col='blue')
abline(v=c(-z_critical,z_critical),col='red')

#this just a simple plot where I was just trying out different commands. Please forgive the crudeness :)