NB. Comments in J are prefixed by NB. (the dot after NB is necessary!)

NB. TODO:
NB.  * [ ] tacit functions, script execution (script is basically eval - evals a string): https://www.jsoftware.com/help/learning/04.htm
NB.  * [ ] booleans are represented by 1, 0 (are there any aliases like true, false ?)
NB.  * [ ] more arithmetic operations - sin, log, exponentiation
NB.  * [ ] binary level operations (MAYBE same as booleans): &, |, xor
NB.  * [ ] array indexing: https://code.jsoftware.com/wiki/Studio/Indexing
NB.  * [ ] operations (eg. take, drop, inner product, outer product, matrix multiplication)
NB.  * [ ] string operations (eg. split, join, replace, etc)
NB. some basic math, array operations are at https://code.jsoftware.com/wiki/User:Devon_McCormick/MinimalBeginningJ
NB.  * [ ] read input from terminal
NB.  * [ ] file I/O
NB.  * [ ] exit script
NB.  * [ ] if-else, explicit loops : https://code.jsoftware.com/wiki/Doc/J4APL#Execution_Control
NB.  * [ ] import modules (installed external packages)
NB.  * [ ] define modules to be imported
NB.  * [ ] calling system commands
NB.  * [ ] plotting data on graphs
NB.  * [ ] read CLI arguments
NB.  * [ ] conjugates (higher order functions I think, which can take and return functions?)
NB.  * [ ] get help for a symbol

NB. a string, which is automatically printed as J prints value of any expression by default:
'Hello World' 

NB. An array of numbers (_ is negative)
NB. 3e7 is exponential notation - it means 3 * 10
NB. 3j_2.5 is a complex number having real part 3, imaginary part -2.5
2 3e7 _4 50.3 3j_2.5

_     NB. Infinity
__    NB. Negative Infinity  

NB. An expression, showing some operations (here % is divide). 
NB. In J, there's no order of operations: everything is parsed right-to-left.
NB. This is equal to 5 + (4 x (2 % (5 - (3 ^ 2)))) = 3:
5 + 4 * 2 % 5 - 3 ^ 2

NB. These functions work on arrays, too:
1 2 3 4 * 5              NB. 5 10 15 20
1 2 3 4 * 5 6 7 8        NB. 5 12 21 32

NB. All verbs (functions) have monadic (single-argument) and dyadic (dual-argument)
NB. meanings. For example, "*" applied to two arguments
NB. means multiply, but when applied to only a right-hand
NB. side, it returns the sign:
* _4 _2 0 2 4            NB. _1 _1 0 1 1

NB. Values can be compared using these operators (1 means
NB. "true", 0 means "false"):
10 20 30 = 10 20 99      NB. 1 1 0
10 20 30 < 10 20 99      NB. 0 0 1

NB. i. n" returns a vector containing the first n naturals.
NB. Matrices can be constructed using $ (reshape):
4 3 $ i. 5               NB. 0 1 2
                         NB. 3 4 0
                         NB. 1 2 3
                         NB. 4 0 1

NB. Single-argument $ gives you the dimensions back:
$ 4 3 $ i. 5            NB. 4 3

NB. Global variables can be assigned using =:
NB. Let's calculate the mean value of a vector of numbers:
A =: 10 60 55 23

NB. Sum of elements of A (/ is reduce):
+/A                      NB. 148

NB. Length of A:
$A                       NB. 4

NB. Mean:
(+/A) % ($A)             NB. 37

NB. We can define this as a monadic verb (function), i.e. it has single argument "y":.
mean =: 3 : 0            NB. "3 : 0" is header for monadic verbs
   sum =. +/y            NB. local variable (scoped to function) defined using =.
   sum % $y
)     NB. closing bracket ends verb definition
mean A                   NB. 37

NB. We can also define dyadic verbs having 2 arguments: "x" (left) and "y" (right).
NB. A function for finding positive difference of 2 numbers:
posdiff =: 4 : 0         NB. "4 : 0" header for dyadic verbs
   larger  =. x >. y     NB. >. is maximum
   smaller =. x <. y     NB. <. is minimum
   larger - smaller 
)
3 posdiff 4             NB. 1
4 posdiff 3             NB. 1

NB. We can rewrite this as a one-line function written as a character string
NB. preceded by 4 : (for dyadic verb), or 3 : (for monadic verb)
posdiff =: 4 : '(x >. y) - (x <. y)'
4 posdiff 3             NB. 1

NB. Multi-line text (character string with zero or more newlines) assigned to a variable
txt =: 0 : 0            NB. "0:0" is header for multi-line strings 
This is a multi-line
string.
)
txt                     NB. print the string
$ txt                   NB. length of string: 55

NB. A string is just an array of characters, so verbs like = operate per character.
NB. LF is line-feed character (newline).
+/ txt = LF             NB. number of lines in string: 2  