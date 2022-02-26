# Question 1: Forward substitution

# 1. Write a function is_lower_triangular(A) which receives as input a matrix A and returns true if is lower triangular or false otherwise.

function is_lower_triangular(A)
     k=0
    for i in 1:size(A,1)
        for j in 1:size(A,2)
            if >(j,i) & A[i,j]!= 0
                k = k + 1
            end
        end
    end
    if k==0
        println("True")
    else
        println("False")
    end
end

B = [2 0 1;1 3 0;3 -1 1]
is_lower_triangular(B)

# 2. Write a function forward_substitution(A,b) which receives a matrix $A$ and a vector $b$. This function should first check if the $A$ it received is lower triangular (You should use your solution to the first part). If so, it calculates using forward substitution the vector $x$ that solves the linear equation $Ax = b$ and returns $x$. If $A$ is not lower triangular, it prints a message warning the user and returns nothing.

function forward_substitution(A,b)
    k=0
    for i in 1:size(A,1)
        for j in 1:size(A,2)
            if >(j,i) & A[i,j]!= 0
                k = k + 1
            end
        end
    end
    if k==0
        x1 = b[1,1]/A[1,1]
        x2 = (b[2,1] - A[2,1]*x1)/A[2,2]
        x3 = (b[3,1] - A[3,1]*x1 - A[3,2]*x2)/A[3,3]
        println("The solution to the given linear system is: x1 = $x1, x2 = $x2 and x3 = $x3.")
        return x=[x1 x2 x3]'
    else
        println("ERROR: The matrix is not lower triangular.")
    end
end

# 3. Using the function you wrote in part 2, solve a linear system.

A = [2 0 0;1 3 0;3 -1 1]
b = [4 1 3]'

forward_substitution(A,b)