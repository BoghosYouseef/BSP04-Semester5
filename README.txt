<<<<< READ ME FILE FOR BSP04 TECHNICAL DELIVERABLES>>>>>

	<Author: Boghos Youseef>
	<Email: Boghos.youseef.001@student.uni.lu>
********************************************************
THIS READ ME FILE DESCRIBES THE FILES CONTAINTED WITHIN THE 
BACHELOR SEMESTER PROJECt 04. 
********************************************************
The project contains 3 files:

1-scratch.py
2-DynamicSystem.cma
3-recursive_dynamic_system.m

/////////////////////////////////////////////////////////

Dependencies:
	-----{scratch.py}-----
Required environment to activate and run this program is any environment that supports python (.py) files
--------------------------------------------------
	-----{DynamicSystem.cma}-----
Required environment to activate and run this program is contained in a zip file named vam.zip
Unzip and run the file vam.bat for Windows. Run vam.sh  for Linux.
steps to run:
	1- run the vam.bat or vam.sh.
	2- click on "Program" button at the top left corner.
	3- choose the DynamicSystem.cma to be opened.
	4- after the program is loaded click "Run" button, next to the "Program" button in the top left corner.

now the animation showing how the program is working should start.
----------------------------------------------------
	-----{recursive_dynamic_system.m}-----
Required environment to activate and run this program is matlab environment provided by mathworks.

/////////////////////////////////////////////////////////

The goal of the project is to implement a dynamic system

with the following properties:

iteration 1 = A *x0 + constant
iteration 2 = A *x1 + constant
iteration 3 = A *x2 + constant

Each iteration is used as a value for x in the iteration that follows.
so x1 = A *x0 + constant
and x2 = A *x1 + constant
and so on until a specific amount of iterations has been reached.

The values of the constant and x were chosen to be equal to 3 in the following files.
----------------------<FILES EXPLANATION>---------------------------------------------

1- scratch.py which is a python file that contains source code for a dynamic system implementation that
calculates the value of a recursive function "recursive_like_func(A, x , term_num)". 
	The function has the following variables:
						  a) A, this is a Real number
						  b) x, also a number.
						  c) term_num, this number represents the amount of iterations the recursion goes through.
						  so example, if a user wanted to know the value of the function after 5 terms, the user
						  has to write 5 into the place of term_num.

				The recursive_like_func(A, x, term_num) returns  recursive_like_func(A, x1, term_num)
				where x1 = (A*x0) + constant. In the body of the function, any A*x + constant is defined as the variable y.

				which is put as a value for the variable x in the next call of the function (the return value of the current function)


2- DynamicSystem.cma is a C machine code file that contains source code for a dynamic system impleentation that 
calculates the value of the expression A*x0 + constant and puts that value as x1 in the next iteration A*x1 + constant and
returns the value A*xn + constant according to the nth term provided at the beginning of the program.
This program uses a while loop in the following way:
	<making space for a variable to count iterations>
		line1) alloc 5  "allocates 5 memory addresses to be used by the program"
		line2) loadc 0  "loads the constant value 0 at the top of the stack"
		line3) storea 4 "stores the value at the top of the stack (the last value calculated or loaded) in the 5th memory address"
	
	<making space for the variable A>
		line6) loadc 3 "load the constant value 3 at the top of the stack"
		line7) 0 "store the value loaded previously into the first memory address"
		line8) pop "removes the value at the top of the stack, 
						used to remove unecessary values resulting from calling operations"
	<making space fo the variable x>
		line9) loadc 1
		line10) storea 1
		line11) pop
	<making space for the constant>
		line13) loadc 3
		line14) storea 1
		line15) pop

lines 17 through 39:
	a while loop that checks if the value at the 5th memory address is equal to a constant(the term number to reach, line37)
	and if not it keeps going back to line 17 and starting over with the same process as described in the beginning of this document.





3- recursive_dynamic_system.m

the implementation of the algorithm mentioned in the beginning of this file in matlab is the same as the implementation in python but with the sytax of matlab
