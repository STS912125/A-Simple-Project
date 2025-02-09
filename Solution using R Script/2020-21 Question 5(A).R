#Problem I am trying to solve:

#2020-21 Q5(A):

# A particular part that is used as an injection device is sold in lots of 10. The
# producer feels that the lot is deemed acceptable if no more than one defective is in the
# lot. Some lots are sampled and the sampling plan involves random sampling and
# testing 3 of the parts out of 10. If none of the 3 is defective, the lot is accepted.
# Comment on the utility of this plan.

#if the lot was indeed acceptable...

N = 10
k = 1
n = 3
x = 0

prob = dhyper(x,k,N-k,n)

cat("Even if the lot was acceptable, the above situation would occur ", prob*100, "% of the time.\nNot a good method")