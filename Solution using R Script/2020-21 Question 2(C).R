#Problem I am trying to solve:

#2020-21 Q2(C):

# (c) A survey of those using a particular statistical software system indicated that 10%
# were dissatisfied. Half of those dissatisfied purchased the system from vendor A. It is
# also known that 20% of those surveyed purchased from vendor A. Given that the
# software package was purchased from vendor A, what is the probability that this
# particular user is dissatisfied?

P_A = 0.20
P_A_given_D = 0.05
P_D = 0.10

P_D_given_A = (P_A_given_D) * (P_D)/P_A

cat("Ans: ",P_D_given_A)