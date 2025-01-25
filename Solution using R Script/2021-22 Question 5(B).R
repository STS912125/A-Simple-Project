#Problem I am trying to solve:

#2021-22 Q5(B):

#Every hour, 10,000 cans of soda are filled by a machine among which 200
#underfilled cans are produced. Each hour, a sample of 30 cans is randomly selected
#and the number of ounces of soda per can is checked. Denote by X the number of
#cans selected that are underfilled. Find the probability that at least I underfilled can
#will be among those sampled


#This is a hypergeometric distribution which can be approximated by a binomial distribution
N = 10000
k = 200
n = 30

#at least 1 means P(X) is not zero. basically 1 - P(0) is what we are calculating

X = 0 

prob = 1- dhyper(X, k, N-k, n)

cat("Probability of getting least I underfilled can is", prob, "\n")

#If we solved it using binomial instead

p = k/N

prob_bin = 1- dbinom(X, n, p)

error = abs(prob-prob_bin)*100/prob

cat("It can also be solved via binomial in which case the error would be ", error,"%")

#playing around with ggplot


x_values = 0:n

Hyper_values = dhyper(x_values, k, N-k, n)
Bin_values = dbinom(x_values, n, p)

data_for_plot = data.frame(x_values, Hyper_values, Bin_values)

library(ggplot2)

ggplot(data_for_plot, aes(x= x_values))+
  geom_bar(aes(y=Hyper_values), stat = "identity")+
  geom_bar(aes(y=Bin_values), stat = "identity")
  

# the binomial and hypergeometric curves are overlapping here.The probabilities are clustering around the right here given the very low probability



