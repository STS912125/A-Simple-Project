#Problem I am trying to solve:

#2020-21 Q7(A):


# An experiment was conducted on a new model of a particular make of automobile
# to determine the stopping distance at various speeds. The following data were recorded. 
# Speed v 35 50 65 80 95 110
# (km/hr)
# Stopping 16 26 41 62 88 119
# Distance, d(m)
# (i.) Fit a multiple regression curve of the form
# d = b0 + b1v + b2v^2
# (ii). Estimate the stopping distance when the car is traveling at 70 kilometers per
# hour.

v = c(35, 50, 65, 80, 95, 110)
d = c(16, 26, 41, 62, 88, 119)

#using the least sqaure method, sum(d - b0 + b1v + b2v^2) has to be minimized
#so we take a partial derivative with respect to b0, b1, b2
#We arrive at a system of linear equation

# a11*b0  + a12*b1 + a13*b2 = D1
# a21*b0  + a22*b1 + a23*b2 = D2
# a31*b0  + a32*b1 + a33*b2 = D3

#It turns out..

a11 = length(v)
a12 = a21 = sum(v)
a13 = a31 = a22 =  sum(v**2)
a23 = a32 = sum(v**3)
a33 = sum(v**4)
D1 = sum(d)
D2 = sum(v*d)
D3 = sum(d*(v**2))

  
  
A = matrix(c(a11, a12, a13, 
              a21, a22, a23, 
              a31, a32, a33), byrow = TRUE, nrow = 3)

D = c(D1,D2,D3)

B = solve(A,D)
b0 = B[1]
b1 = B[2]
b2 = B[3]
#thats the solution :)
cat("The solution to the system is:\n")
cat("b0 =", B[1], "\n")
cat("b1 =", B[2], "\n")
cat("b2 =", B[3], "\n")

new_d = b0 + b1*(70) + b2*(70)^2

cat("The estimated stopping distance at 70 km/hr is", new_d, "meters.\n")
