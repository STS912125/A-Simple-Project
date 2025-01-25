#Problem I am trying to solve:

#2021-22 Q4(B):

#Zakir Hossain is vice president for human resources for a large manufacturing
#company. In recent years, he has noticed an increase in absenteeism that he thinks is
#related to the general health of the employees. Four years ago, in an attempt to
#improve the situation, he began a fitness program in which employees exercise during
#their lunch hour. To evaluate the program, he selected a random sample of eight
#participants and found the number of days each was absent in the six months before
#the exercise program began and in the last six months. Below are the results. At the
# 0.05 significance level, can he conclude that the number of absences has declined?
#Estimate the p-value.

provided_data = "
Employee Before After
1 6 5
2 6 2
3 7 1
4 7 3
5 4 3
6 3 6
7 5 3
8 6 7"

data = read.table(text = provided_data , header = TRUE, sep = " ")#Learning some data manipulation here :)
#Since the Before and after test data is dependent, and population variance is unknown, a paired test has to be used
# the null hypothesis is that, the mean of differences is zero

data$Difference = data$Before-data$After


n = length(data$Employee) #sample size
df = n-1 #degrees of freedom
sample_mean = mean(data$Difference)
Hyp_mean  = 0 #null hypothesis
variance = var(data$Difference)
sigma = sqrt(variance/n)
z= abs(sample_mean-Hyp_mean)/sigma #btw I was just copy pasting the code from my other codes here. too lazt to change z to t every single time :i

alpha = 0.05
significant_probability =1-(alpha)
z_critical = qt(significant_probability,df) #one tailed test
if (z<z_critical)
{
  cat("Hypothesis Accepted Since the calculated Z value of ",z,"is on the left region of the critical z value of ",z_critical,"\n")
  
}else
{
  cat("Hypothesis Rejected Since the calculated Z value of ",z,"is on the right region of the critical z value of ",z_critical,"\n")
}
p_value = 1 - pt(z,df)
if (p_value > alpha)
{
  cat("Hypothesis Accepted Since the calculated P value of ",p_value,"is bigger than the significant value of ",alpha,"\n")
}else
{
  cat("Hypothesis Rejected Since the calculated P value of ",p_value,"is smaller than the significant value of ",alpha,"\n")
}


library(ggplot2)

x_values = seq(-4,4,length=100)
y_values = dt(x_values,df)
data = data.frame(x_values, y_values)

ggplot(data, aes(x=x_values,y=y_values))+
  geom_line()+
  geom_vline(xintercept = z_critical,color= "red")+
  geom_vline(xintercept = z,color= "blue")+
  geom_area(data= subset(data, x_values>z_critical),fill="red", alpha=0.3)+
  geom_area(data= subset(data, x_values<=z_critical),fill="green", alpha=0.3)+
  labs(title = "Visualizing the Problem :)", x= "Random Variable", y= "Probability Density")

cat("This indicates that the Number of absences has not declined significantly")








