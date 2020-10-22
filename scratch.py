iteration = 0   # a variable to store the number of iterations of the recursive function


def recursive_like_func(A, x , term_num):
    '''
    This recursive function takes a variable x value, an A value, and a term_num. then it keeps recursively
    multiplying the A with x and adding a constant to the result. Then the recursive step is when it returns the function call itself,
    but this time the result of the last computation is used as the value of the new x input.
    parameters:

    :param A: a parameter that is given with the dynamic system. gets multiplied with the variable x.
    :param x: the variable in the dynamic system.
    :param term_num: the number of terms to calculate up to and including that term number.
    :return: True when it reaches the desired iteration number.
    '''
    # constant = randint(0, 100)   #bt where t = term_num at each iteration. when constant changes
    constant = 3   # the constant in the dynamic system
    global iteration    # declaring iteration variable global allows access and modification from inside function.
    print(f"X{iteration} = {x}")  # print the variable associated with its term number
    print(f"A^{iteration} = {A**iteration}, x{iteration} = {x}, b = {constant}, y = {(A*x)+constant}")  #print the dynamic system equation
    iteration += 1      # increment the global variable every time the function is called
    if iteration == term_num:   # check if the current iteration is equal to the term number.
        return True     #returns bool type true
    return recursive_like_func(A,((A*x)+constant), term_num)   #otherwise returns the same function call but with a different input for x.

print(recursive_like_func(3,1, 4))
# def test_func(a, b, c):
#     global iteration
#     if iteration == 10:
#         return 0
#     else:
#
#         iteration += 1
#
#     print(f"a^{iteration}={a**iteration}, b={b}, c={c}, a*b+c = {(a*b)+c}")
#     return test_func(a, (a*b)+c, c)
#
# print(test_func(3, 1, 3))