from random import randint


iteration = 0
def recursive_like_func(x , term_num):
    constant = randint(0, 100)
    global iteration
    iteration += 1
    print(f"Term: {x} + {constant}. Iteration: {iteration}")
    print(f"x^{iteration} + {constant}")
    if iteration == term_num:
        return True
    return recursive_like_func(((3*x)+constant), term_num)

print(recursive_like_func(1, 100))
