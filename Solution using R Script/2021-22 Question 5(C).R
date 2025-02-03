#Problem I am trying to solve:

#2021-22 Q5(C):

#(c) Let X1 and X2 be independent random variables each having the probability distribution:
#f(x)={e^(−x),when x>0, 0 elsewhere}
#Show that the random variables Y1 and Y2 are independent when Y1 = X1 + X2 and Y2 = X1/( X1 + X2)

#You could do this Symbolically and Find the Joint Distribution of Y using Formula

library(Ryacas0)

# X1= Sym("X1") #defining it as a symbol
# X2= Sym("X2")
Y1 = Sym("Y1") 
Y2 = Sym("Y2")
# Y1 = X1 + X2
# Y2 = X1/(X2+X1)
X1 = Y1*Y2
X2 = Y1-Y1*Y2

PartialY1X1 =  deriv(X1,Y1)
PartialY2X1 =  deriv(X1,Y2)
PartialY1X2 =  deriv(X2,Y1)
PartialY2X2 =  deriv(X2,Y2)

cat(PartialY1X1,"\t",PartialY1X2,"\n",PartialY2X1,"\t",PartialY2X2,"\n")

#This is the jacobian matrix, the determinant of this is -Y1
#I couldn't do this in R, lets define it manually

det = -Y1

# the joint distribution of Y1 and Y2 turns out to be e ^ (-Y1)*(-Y1)

jointDist = (exp(1) ** (-Y1)) * abs(-Y1)

#Now the limit of Y2 is actually 0-1, I later confirmed this via simulation
#so to find the marginal distribution of y1, you need to integrate from 0 to 1 over y2
#to find the marginal distribution of y2, you need to integrate from 0 to infinity over y1
#basically it's too complicated to do the calculation in R, it turns out that,
P(Y1) = Y1e^(-Y1) #and 
P(Y2) = 1
#since 
p(y1,y2) = p(y1)*p(y2)

#this basically confirms the independence of y1
 

#You could also simulate the data

x1 = rexp(100, rate = 1) #generating an exponential variable
x2 = rexp(100, rate = 1)
#print(range(x1)) and print(range(x2)) to confirm their ranges
y1 = x1 + x2
y2 = x1/(x1+x2)
#print(range(y2)) and print(range(y1)) to confirm their ranges

pltdata = data.frame(y1,y2)

library(ggplot2)

ggplot(pltdata, aes(x=y1,y=y2))+
  geom_point()

#If you look at the plot, there doesn't seem to be a strong correlation between y1 and y2
#which supports the theory that y1 and y2 are independent
