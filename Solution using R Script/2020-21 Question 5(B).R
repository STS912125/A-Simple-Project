#Problem I am trying to solve:

#2020-21 Q5(B):

# A large chain retailer purchases a certain kind of electronic device from a
# manufacturer. The manufacturer indicates that the defective rate of the device is 3%.
#   (i) The inspector of the retailer randomly picks 20 items from a shipment. What is the
# probability that there will be at least one defective item among these 20?
#   (ii) Suppose that the retailer receives 10 shipments in a month .and the inspector
# randomly tests 20 devices per shipment. What is the probability that there will be 3
# shipments containing at least one defective device?
#   (c) During a laboratory experiment the average number of radioactive particles passing
# through a counter in 1 millisecond is 4. What is the probability that 6 particles enter the
# counter in a given millisecond?

p_atleast1 = 1-dbinom(0, 20, 0.03)

cat("(i)probability that there will be at least one defective item is ",p_atleast1,"\n")

p_3shipments = (choose(10,3)) * (p_atleast1)^3 * (1-p_atleast1)^7

cat("(ii)probability of 3 shipments containing at least one defective devices is ",p_3shipments,"\n")

p_6milliseconds = dpois(6,4)

cat("(ii)probability of 6 particles entering the counter in a given millisecond is ",p_6milliseconds,"\n")
