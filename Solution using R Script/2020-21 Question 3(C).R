#Problem I am trying to solve:

#2020-21 Q3(C):

# (c) Let X denote the number of times a certain numerical control machine will
# malfunction: 1,2,or3 times on any given day. Let Y denote the number of times a
# technician is called on an emergency call. Their joint probability is given as:
# 
# f(x, y) 
#    x = 1 2 3
# y
# 1 0.05 0.05 0.1
# 2 0.05 0.1 0.35
# 3 0    0.2  0.1
# 
# (i) Evaluate the marginal distribution of x.
# (ii) Evaluate the marginal distribution of y.
# (iii) Find P(y = 3 | x = 2).


x = rep(c(1,2,3), times = 3)
y =  rep(c(1,2,3), each = 3)

prob = c(0.05, 0.05, 0.1, 0.05, 0.1, 0.35, 0, 0.2, 0.1)

F_XY = data.frame(x,y,prob)

library(dplyr)

G_X <- F_XY %>%  group_by(x) %>% summarise(`prob` = sum(prob))
H_Y <- F_XY %>%  group_by(y) %>% summarise(`prob` = sum(prob))

# P(y = 3 | x = 2) = F(x=2,y=3)/G(x=2)

Px2 = filter(G_X,x==2)$prob 
Px2y3 = filter(F_XY, x==2 & y==3)$prob 

py3_given_x2 = Px2y3/Px2

cat("(i) The marginal distribution of x is\n")
print(G_X)
cat("\n(ii)The marginal distribution of  y is\n")
print(H_Y)
cat("\n(iii) P(y = 3 | x = 2) = ",py3_given_x2,"\n")
