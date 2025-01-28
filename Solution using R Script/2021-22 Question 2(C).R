#Problem I am trying to solve:

#2021-22 Q2(C):

#A service facility operates with two service lines. On a randomly selected day, let
#X be the proportion of time that the first line is in use whereas Y is the proportion of
#time that the second line is in use. Suppose that the joint probability density function
#for (X Y) is
#f(x,y)={3/2(x2+y2) when 0≤x,y≤1, 0 elsewhere}

#1. Compute the probability that neither line is busy more than half the time.
#2. Find the probability that the first line is busy more than 75% of the time.

#For question 1, range of x is from 0 to 0.5

library(pracma) #trying out a new package:)

fn = function(x,y) 3*(x^2+y^2)/2

prob_of_half = integral2(fn ,xmin = 0, xmax = 0.5, ymin = 0, ymax = 0.5)

#turns out, it's a list. prob_of_half[["Q"]] denotes the probability

cat("the probability that neither line is busy more than half the time is ",prob_of_half[["Q"]],"\n")

prob_of_75 = integral2(fn ,xmin = 0.75, xmax = 1, ymin = 0, ymax = 1)

cat("the probability that the first line is busy more than 75% of the time is ",prob_of_75[["Q"]],"\n")