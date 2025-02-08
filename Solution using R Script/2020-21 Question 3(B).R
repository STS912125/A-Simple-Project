#Problem I am trying to solve:

#2020-21 Q3(B):

# (b) Suppose a special type of small data processing firm is so specialized that some
# have difficulty making a profit in their first year of operation. The pdf that
# characterizes the proportion y that make a profit is given by 

# f = {(1/k) * (y**4) * (1-(y**3))} when 0<y<1

#   elsewhere.
#   (i) What is the value of k that renders the above a valid density function?
#     (ii) Find the probability that at most 50% of the firms make a profit in .the first
#   year.
#   (iii) Find the probability that at least 80% of the firms make a profit in the first
#   year.

f = function(y){(y**4)*(1-(y**3))}
variable = integrate(f,lower = 0,upper = 1)
k = variable$value

FDist = function(y){(1/k) * (y**4) * (1-(y**3))}

p_50 = integrate(FDist,lower = 0,upper = 0.5)

p_80 = integrate(FDist,lower = 0.8,upper = 1)


cat("(i) ans: ",k,"\n(ii) ans: ",p_50$value,"\n(iii) ans: ",p_80$value,"\n")

library(ggplot2)

y_values = seq(0, 1, by = 0.01)
pdf_values = sapply(y_values, FDist)

# Create dataframe for ggplot
plot_data = data.frame(y = y_values, density = pdf_values)

# Plot the PDF
ggplot(plot_data, aes(x = y, y = density)) +
  geom_line() +
  labs(title = "PDF of Y", x = "y", y = "Density") +
  geom_vline(xintercept = c(0.50,0.80), color ="blue")
