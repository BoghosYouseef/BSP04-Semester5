from random import randint


iteration = 0
def recursive_like_func(A, x , term_num):
    constant = randint(0, 100)   #b
    global iteration
    iteration += 1
    print(f"Term: {x} + {constant}| Iteration: {iteration}")
    print(f"{A} * x^{iteration} + {constant} = y = {A*x*constant}")
    print(f"A = {A}, x^{iteration}, b = {constant}, y = {A*x*constant}")
    if iteration == term_num:
        return True
    return recursive_like_func(A,((A*x)+constant), term_num)

print(recursive_like_func(3,1, 100))
