module Main where

       -- Generic and typed function
       double1 x = x + x

       double2 :: Integer -> Integer
       double2 x = x + x

       -- Normal function definition and 'guards'
       factorial1 :: Integer -> Integer
       factorial1 0 = 1
       factorial1 x = x * factorial1(x - 1)

       factorial2 :: Integer -> Integer
       factorial2 x
                  | x > 1 = x * factorial2(x - 1)
                  | otherwise = 1

       -- Several Fibonacci functions
       ---- No.1 Very bad one, cannot compute over ~10
       fib1 :: Integer -> Integer
       fib1 0 = 1
       fib1 1 = 1
       fib1 x = fib1(x-1) + fib1(x-2)

       ---- No.2 Using tuples to reduce iteration dramatically
       fib2Tuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
       fib2Tuple (x, y, 0) = (x, y, 0)
       fib2Tuple (x, y, index) = fib2Tuple(y, x+y, index-1)

       fib2Result :: (Integer, Integer, Integer) -> Integer
       fib2Result (x, y, z) = x

       fib2 :: Integer -> Integer
       fib2 (x) = fib2Result(fib2Tuple(1, 1, x))

       ---- No.3 Tuple, destructuring and function composition
       fib3NextPair :: (Integer, Integer) -> (Integer, Integer)
       fib3NextPair (x, y) = (y, x+y)

       fib3NthPair :: Integer -> (Integer, Integer)
       fib3NthPair 1 = (1, 1)
       fib3NthPair n = fib3NextPair(fib3NthPair(n-1))

       fib3 :: Integer -> Integer
       fib3 = fst . fib3NthPair

       -- List iteration
       size [] = 0
       size (h:t) = 1 + size t

       -- Recursion
       allEven :: [Integer] -> [Integer]
       allEven [] = []
       allEven (h:t) = if even h then h:allEven(t) else allEven t

       -- High order function
       squareAll list = map square list
                 where square x = x * x
