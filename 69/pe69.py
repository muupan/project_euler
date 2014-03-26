# from gmpy import mpz
import gmpy as mpz

def gcd(n, m):
    while m:
        n, m = m, n % m
    return n

def phi(n):
    return len([m for m in xrange(1, n) if gcd(n, m) == 1])

last_prime = 2
n = 2
while n <= 1000000:
    possible_prime = mpz.next_prime(last_prime)
    while not mpz.is_prime(possible_prime):
        possible_prime = mpz.next_prime(possible_prime)
    n = n * possible_prime
    last_prime = possible_prime
    print "n:", n, " n/phi:", float(n)/phi(n)
