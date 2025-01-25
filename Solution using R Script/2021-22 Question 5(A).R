#Problem I am trying to solve:

#2021-22 Q5:

#if the probability that a fluorescent light has a useful life of at least 800 hours is 0.9,
#find the probabilities that among 20 such lights-
#(a) exactly 18 will have a useful life of at least 800 hours;
#(b) at least 15 will have a useful life of at least 800 hours;
#(c) at least 2 will not have a useful life of at least 800 hours;

p = 0.9 #probability of success

#this follows a binomial distribution

n = 20 #size

xa = 18 #no of success

prob_a = dbinom(xa, n, p) # Exactly 18

xb = 15

prob_b = 1- pbinom((xb-1), n, p) #at least 15

xc = 2

prob_c = pbinom((n-xc), n, p) #at most 18 basically

cat("Probability of getting exactly 18 is ", prob_a,"\nProbability of at least 15 is ",prob_b,"\nProbability of at most 18 is ",prob_c,"\n")


