# Question 2: Nash-Bertrand equilibrium
using ForwardDiff, LinearAlgebra

# Model parameters
alpha = 0.25
c = [2.0; 3.0]
M = 1000

### Start your solution from here
function newtons_method_multidim(f, f_jacobian, initial_guess)
    tolerance = 1e-3
    difference = Inf
    x = initial_guess
    while norm(difference) > tolerance
        println("Intermediate guess: $x")
        x_prev = x
        x = x_prev - f_jacobian(x_prev)\f(x_prev)
        difference = x - x_prev
    end
    println("The root of f(x) is $x")
end

p = [;]
s(x) = exp.(-0.25.*x)/(1 + sum(exp.(-0.25.*x)))
s_p(x) = alpha*[-s(x)[1,1](1-s(x)[1,1]) s(x)[1,1]*s(x)[2,1];s(x)[1,1]*s(x)[2,1] -s(x)[2,1](1-s(x)[2,1])]'
f(x) = M*(s(x) + [p[1,1]-c[1,1] 0;0 p[2,1]-c[2,1]]*s_p(x)')
