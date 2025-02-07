#Problem I am trying to solve:

#2020-21 Q1(D):

# (d) A manufacturer of a flu vaccine is concerned about the quality of its flu serum.
# Batches of serum are processed by three different departments having rejection rates of
# 0.10, 0.08, and 0.12, respectively. The inspections by the three departments are
# sequential and independent. 
# (i) What is the probability that a batch of serum survives the first departmental
# inspection but is rejected by the second department?
# (ii) What is the probability that a batch of serum is rejected by the third
# department?

p_1 = 0.10
p_2 = 0.08
p_3 = 0.12

p_12 = (1 - p_1)*(1 - p_2)*p_3 + (1 - p_1)*(1 - p_2)*(1 - p_3)

p_R3 = (p_1)*(p_2)*(1 - p_3) + (1 - p_1)*(1 - p_2)*(1 - p_3) + (1 - p_1)*(p_2)*(1 - p_3) + (p_1)*(1 - p_2)*(1 - p_3)

cat("(i) ans: ",p_12,"\n(ii) ans: ",p_R3,"\n")