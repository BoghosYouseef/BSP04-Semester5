clc
clear all

global iteration;
iteration = 0;

recursive_dynamic_system_func(3, 1, 5)


function RDS = recursive_dynamic_system_func(A, x, term_num)    
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    constant = 3;
    global iteration
    if iteration == term_num
        else
            iteration = iteration + 1;

            fprintf("A^%d = %d \n", iteration, power(A, iteration))
            fprintf("x = %d \n", x)
            fprintf("b = %d \n", constant)

            y = A*x;
            y = y + constant;
            fprintf("y = %d * %d + %d = %d \n", A, x, constant, y)
            
            recursive_dynamic_system_func(A, y, term_num);
            
    end
end

