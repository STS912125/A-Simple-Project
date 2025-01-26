#Problem I am trying to solve:

#2021-22 Q1(D):

#An automobile manufacturer is concerned about a possible recall of its bestselling
#four-door sedan. If there were a recall, there is a probability of 0.25 of a defect
#in the brake system, 0.18 of a defect in the transmission, 0.17 of a defect in the fuel
#system, and 0.40 of a defect in some other area.
#(i) What is the probability that the defect is the brakes or the fueling system if the
#probability of defects in both systems simultaneously is 0.15?
#(ii) What is the probability that there are no defects in either the brakes or the
#fueling system?

p_brake = 0.25
p_trans = 0.18
p_fuel = 0.17
p_other = 0.4

#confirmed p_brake +p_trans + p_fuel + p_other is 1

p_brake_and_fuel = 0.15

p_brake_or_fuel = p_brake + p_fuel - p_brake_and_fuel
p_no_defects = 1 - p_brake_or_fuel

cat("probability that the defect is the brakes or the fueling system is ",p_brake_or_fuel,
    "\nprobability that there are no defects in either is ",p_no_defects,"\n")
