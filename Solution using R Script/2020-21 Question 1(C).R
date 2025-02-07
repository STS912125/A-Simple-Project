#Problem I am trying to solve:

#2020-21 Q1(C):

# c) Suppose that two people are randomly chosen from a group of 4 women and 6 men.
# (i) What is the probability that both are women?
#   (ii) What is the probability that one is a woman and the other is man?

P_WW =( 4/(4+6) )*( 3/(3+6))

p_WW_alt = (choose(4,2))*(choose(6,0))/(choose(10,2))

cat("(i) ans: ",P_WW)

P_WM =(choose(4,1))*(choose(6,1))/(choose(10,2))

cat("(ii) ans: ",P_WM)
