#Problem I am trying to solve:

#2021-22 Q2(B):

#A rare disease exists with which only 1 in 500 is affected. A test for the disease
#exists, but of course it is not infallible. A correct positive result 
#(patient actually has the disease) occurs 95% of the time, while a false positive 
#result (patient does not have the disease) occurs 1% of the time. 
#If a randomly selected individual is tested and the result is positive, 
#what is the probability that the individual has the disease?

P_disease = 1/500
P_nodisease = 1-P_disease
P_pos_given_disease = 0.95
P_pos_given_nodisease = 0.01

P_disease_given_positive = P_disease*P_pos_given_disease/(P_disease * P_pos_given_disease
                                                          +  P_nodisease*P_pos_given_nodisease)

cat("probability of individual has the disease is", P_disease_given_positive)




