def factorial(n):
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def binomial_coefficient(n, k):
    return factorial(n) // (factorial(k) * factorial(n - k))

def berni(n, k):
    def bernpoly(t):
        binom = binomial_coefficient(n, k)
        return binom * (t ** k) * ((1 - t) ** (n - k))
    
    return bernpoly


# import math
# def berni(n, k):
#     def binomial_coefficient(n, k):
#         return math.comb(n, k)

#     def bernpoly(x):
#         binom = binomial_coefficient(n, k)
#         return binom * (x ** k) * ((1 - x) ** (n - k))
    
#     return bernpoly
