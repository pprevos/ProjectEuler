# Euler Problem 1: Sum of an Arithmetic Sequence
This [first Euler problem](http://projecteuler.net/problem=001) provides a gentle introduction to solving mathematical problems with code. This problem involves finding the sum of two related arithmetic sequences.

The natural numbers below 10 that are multiples of 3 or 5 results are 3, 5, 6 and 9. The sum of these numbers is $3+5+6+9=23$. Your assignment is to find the sum of all the multiples of 3 or 5 below 1000.

This problem is similar to one posed to a mathematics child prodigy that lived around the same time as Euler. When Carl Friedrich Gauss (1777--1855) was ten years old, his teacher gave his pupils a maths problem to ponder on. The teacher was perhaps seeking some quiet time for himself by giving the kids a hard problem. He asked them to sum all the numbers from 1 to 100, which surely would give him enough time to enjoy a cuppa.
 
Young Carl Gauss stood up after just a minute and confidently proudly raised his slate with 5050 written in large chalk letters to the teacher. All the other kids were still diligently adding numbers. How was Carl able to finish his task so quickly?  The details and full truth of this story are lost in history. Perhaps Carl realised the solution while writing the series forwards and backwards:[^hayes2006].

[^hayes2006]: Hayes, B. (2006). Gauss’s Day of Reckoning. *American Scientist*, 94(3), 200. DOI: [10.1511/2006.59.3483](https://doi.org/10.1511/2006.59.3483).

```$
1 + 2 + 3 + \ldots + 98 + 99 + 100

100 + 99 + 98 + \ldots + 3 + 2 + 1
```

Little Carl calculated the sum of some of the pairs and noticed a regularity:

```$
1 + 100 = 2 + 99 = 3 + 98 = \ldots 100 + 1 = 99 + 2 = 98 + 3 = 101
```

Each of the pairs adds up to 101 and there are 50 pairs, therefore the sum of all numbers is half the sum of all pairs. Gauss was not the first to discover this method. Some thirteen hundred years earlier, Indian mathematician and astronomer Aryabhata had already discovered this method to sum a arithmetical sequence.

This anecdote shows that there are two ways to solve this first problem. The smart method that Gauss used or the slow brute force method that his fellow pupils used. The brute force solution requires many steps to find the answer. The smart solution uses a one-step formula, such as the young Gauss and Aryabhata had figured out. This chapter shows some ways to implement the first solution and the second solution to introduce the basic concepts of solving problems in R.

The most inefficient solution is to test whether all numbers between 1 and 999 are divisible by 3 or 5 and then add all these number. The R language provides several ways to step through a sequence of numbers.

The first method is a loop that tests all numbers between 1 and 999. The first step is to define a variable to store the answer. R does this with the assignment operator `<-` . This operator can be used in three different ways and the value assignment moves in the direction of the arrow. Most other computing languages use the `=` symbol to assign a value. This operator can also be used in R, but is usually reserved for assigning values in function calls.

```$
a <- 10        # a = 10
10 -> b        # b = 10
a <- b <- 10   # a = b and b = 10
```

The second step is to loop through all numbers from 1 to 999 and check if the number is divisible by 3 or 5. R defines a counted loop with the `for()` function. All code between curly brackets is interpreted and the loop is incremented at the end, until the sequence terminates.

The code below loops trough the numbers between 1 and 999, indicated by  `1:999` in the code. The colon operator is one of several ways to define a sequence of numbers in R. For example `a <- 1:3` assigns a vector with the numbers 1, 2 and 3 to the variable `a`. In this example, the variable `i` is incremented by 1 every time the code between curly braces is completed, until `i` equals 999.

The penultimate step involves a conditional `if` statement. In R, the condition is placed between brackets. The code between curly braces is executed when the condition is met and skipped if it doesn't. If there is only one line of code immediately after the `if` statement, the curly braces can be omitted. 

This step tests whether the number in the sequence is divisible by 3 or by 5. The `%%` function calculates the remainder of a division (modulo). For example, `25 %% 4` results in 1. When the remainder of a division equals zero, we have found a divisor. 

The `|` symbol performs the OR function. If one or both of these conditions is met, then the value of `answer` is increased by `i`. Note that R uses a double equals sign (`==`) to test for equality.

And finally, the `print()` function displays the result on the screen with the screen.

```
answer <- 0
  for (i in 1:999) {
    if (i %% 3 == 0 | i %% 5 == 0) {
      answer <- answer + i
      print(i)
    }
  }
  print(answer)
```

This first solution is quite elaborate. Using for-loops in R should always be a last resort in R coding because they are the slowest way to compute over a series of steps. The next two solutions solve this problem by using vector arithmetic. These methods are much faster because they run the loop directly in machine code instead of having to compile each step.

The solution for the first problem only requires one line of code when using vector arithmetic.

```
sum((1:999)[((1:999) %% 3 == 0) | ((1:999) %% 5 == 0)])
```

The line starts with the `sum()` function, which as one would expect, sums a sequence of values. In this case, the function sums all numbers from 1 to 999.

```$
sum(1:999)
[1] 499500
```

The square brackets after this expression specify which elements of the sequence need to be added. For example, the expression `(1:10)[3]` gives the number 3. We have to place the sequence in parentheses to clearly define the sequence. 

We can use this technique also with a conditional statement. The statement `(1:10) %% 2 == 0` results in a sequence of boolean values, which are either `TRUE` or `FALSE`.

```$
(1:10) %% 3 == 0
[1] FALSE FALSE TRUE FALSE FALSE TRUE FALSE FALSE TRUE FALSE
```

If we add this line between square brackets, R will only select those members of the sequence that result in a TRUE value.

```$
(1:10)[(1:10) %% 3 == 0]
[1] 3 6 9
```

## Analytical solution
Although the vector arithmetic is much faster than the for-loop, it is still not as fast as using the methods discovered by Aryabhata and Gauss. The two brute-force solutions are very fast because of the low number of steps to find a solution. An analytical solution significantly reduces the processing time as it only requires one step.

The problem involves _arithmetic progressions_, which are sequences of numbers with a constant difference. The sequence 1, 4, 7, 10, 13, ... is an arithmetic progression with a common difference of three.

We can generalise the method discovered by Gauss. The sum of an arithmetic progression (S_n), where $n$ is the number of elements and $a_1$ and $a_n$ are the lowest and highest value, is:

```$
S_n= \frac{n(a_{1} + a_n)}{2}
```

The numbers divisible by $n=3$ can be expressed as:

```$
\mathrm{sum}_3(999)=3+6+9+12+ \ldots + 999 = 3(1+2+3+4+ \ldots + 333)
```

We can now calculate the sum of all divisors by combining the above progression with the formula for arithmetic progressions as expressed in the above code, where $m$ is the divisor and $n$ the extent of the sequence. $p$ is the highest number less than $n$ divisible by $m$. In the case of 5, this number is 995.

$$p = n \lfloor (m/n) \rfloor$$

Substitution gives:

$$\mathrm{sum}_m(n) =  p \frac{1+(p/m)}{2}$$

:NOTES:
Introduce functions later?
:END:

#+BEGIN_SRC R
  SumDivBy <- function(m, n) {
      p <- floor(n / m) * m # Round to multiple of n
      return (p * (1 + (p / m)) / 2)
  }
  SumDivBy(3, 999) + SumDivBy(5, 999) - SumDivBy(15, 999)
#+END_SRC

#+RESULTS:

## Fizzbuzz
A job interview is quite an abstract environment where both parties are acting a role. The traditional recruitment process can lead to hiring somebody who is not competent. When looking for software developers, some recruiters use coding challenges to ensure the candidate has at least rudimentary skills. Fizzbuzz is one of the problems occasionally used by recruiters.

Your task is to write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.

You can find a possible solution to this problem at the end of the book.
