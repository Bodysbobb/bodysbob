# Question 1: Variance estimation

# Installing packages
import Pkg; Pkg.add("Distributions")

# Don't forget to install these packages before running your code
using Random, Distributions 

# This function set the random number generator at a particular
# seed so we can replicate random results
Random.seed!(65200)

# Draw 10 million observations uniformly distributed
# between 10,000,000 and 10,000,001
a = 10000000 # lower limit
b = 10000001 # upper limit
N = 10000000 # number of draws
ys = Random.rand(Distributions.Uniform(a, b), N);

### Start your solution from here

# 1. Calculate the sample mean and store it in variable y_mean.
N = 10000000
y_mean = sum(ys)/N
println("The mean of ys is $y_mean.")

# 2. Calculate the variance using equation (1) and store it in variable s2_eq1.
s2_eq1 = (sum((ys .- y_mean).^2))/N
println("The variance calculated using equation(1) is $s2_eq1.")

# 3. Calculate the variance using equation (2) and store it in variable s2_eq2.
s2_eq2 = (sum(ys.^2)/N) - (y_mean)^2
println("The variance calculated using equation(2) is $s2_eq2.")

# 4. Compare the results from steps 2 and 3 with each other and with the true variance (you don't have tocode the true variance calculation.
t_var = (b - a)^2/12
println("The true variance is $t_var.")