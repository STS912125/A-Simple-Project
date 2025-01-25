#Problem I am trying to solve:

#2021-22 Q3(b):

#Define random variable and expected value. Then calculate E(X)E(X) and E(X2)E(X2) for the following
#X	    00	  11	  22	  33
#P(X) 	0.1	  0.3	  0.4	  0.2

#first I will define everything

x <- c(0,1,2,3)
p_x <- c(0.1,0.3,0.4,0.2)

#I can confirm that the sum is 1 by using sum(p_x)

# x*p_x will multiply element wise in R

e_x <- sum(x*p_x)

cat("E(X) = ", e_x,"\n")

# x ** 2 will square each element in x. x^2 works too

e_x2 <- sum((x^2) * p_x)

cat("E(X2) = ", e_x2,"\n")

# E[(2X + 1)2] can be found this way

x2 = (2*x + 1)^2

e <- sum(x2 * p_x)

# since E[(2X+1)2] = E[4X2+4X+1] = 4E(X2) + 4E(X) + E(1) = 4E(X2) +4E(X) + 1

e2 <- 4*e_x2 + 4*e_x + 1

#print(e==e2) is true

cat("E[(2X+1)2] = ", e,"\n")

#done:D