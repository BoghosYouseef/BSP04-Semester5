iteration = 0
equation_state = []


def recursive_like_func(A, x , term_num):
    # constant = randint(0, 100)   #bt where t = term_num at each iteration. when constant changes
    constant = 3
    global iteration
    print(f"X{iteration} = {x}")
    print(f"A^{iteration} = {A**iteration}, x{iteration} = {x}, b = {constant}, y = {(A*x)+constant}")
    equation_state.append(f"A^{iteration} = {A**iteration},x{iteration} = {x}, b = {constant}, y = {(A*x)+constant}")
    #print(f"EQUATION STATE: {equation_state}")
    iteration += 1
    if iteration == term_num:
        return True
    return recursive_like_func(A,((A*x)+constant), term_num)

print(recursive_like_func(3,1, 5))
