#Problem I am trying to solve:
  
#2021-22 Q1(c):
  
#A pair of fair dice is tossed. Find the probability of getting
#(i) a total of 9;
#(ii) at most a total of 3

die = 1:6

all_outcomes = expand.grid(die1=die,die2=die)

all_outcomes$total = all_outcomes$die1 + all_outcomes$die2

outcomes_with_total_9 = all_outcomes[all_outcomes$total==9, ] # Learning how to filter rows using column contiodions here :)

no_of_ways_tot_9 = nrow(outcomes_with_total_9)
no_of_tot_ways = nrow(all_outcomes)

Probability_of_tot_9 = no_of_ways_tot_9/no_of_tot_ways

outcomes_with_atmost_3 = all_outcomes[all_outcomes$total<=3, ]
no_of_ways_atmost_3 = nrow(outcomes_with_atmost_3)

Probability_of_atmost_3 = no_of_ways_atmost_3/no_of_tot_ways

#So the answer is:

cat("(i)Probability of getting a total of 9 is ",Probability_of_tot_9,"\n(ii)Probability of getting at most a total of 3 is", Probability_of_atmost_3)

#done:)
