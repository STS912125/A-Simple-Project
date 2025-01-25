#Problem I am trying to solve:

#Question 2(a):
  
#A real estate agent has 8 master keys to open several new homes. 
#Only 1 master key will open any given house. 
#If 30% of these homes are usually left unlocked, 
#what is the probability that the real estate agent can get into a specific 
#home if the agent selects 3 master keys at random before leaving the office?

#My Answer

tot_keys = 8
num_of_right_keys = 1
prob_of_Unlocked = 0.4
num_of_keys_chosen = 3

no_of_ways_to_choose_correct_key = choose(num_of_right_keys, 1) * choose((tot_keys-1),(num_of_keys_chosen-1))
tot_num_of_ways_to_choose_key = choose((tot_keys),(num_of_keys_chosen))


prob_having_key = (no_of_ways_to_choose_correct_key)/(tot_num_of_ways_to_choose_key)
prob_not_having_key = 1- prob_having_key

prob_opening_door = prob_having_key + prob_not_having_key * prob_of_Unlocked

cat("Probability of getting into home is", prob_opening_door,"\n")



