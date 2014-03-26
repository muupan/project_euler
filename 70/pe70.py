from sympy import ntheory
import itertools
import sys

def gcd(n, m):
    while m:
        n, m = m, n % m
    return n

def calc_phi(n):
    factors = ntheory.primefactors(n)
    phi = n
    for product_size in xrange(1, len(factors) + 1):
        for comb in itertools.combinations(factors, product_size):
            composite = reduce(lambda a, b: a * b, comb)
            if product_size % 2 == 1:
                phi -= n / composite
            else:
                phi += n / composite
    return phi
    # phi = n
    # for factor in factors:
    #     phi -= n / factor
    #     for smaller_factor in [f for f in factors if f < factor]:
    #         phi += n / (factor * smaller_factor)
    # return phi - 1

def is_permutation(x, y):
    return sorted(list(str(x))) == sorted(list(str(y)))

min_np = sys.maxint
for n in xrange(2, 10 ** 7):
    phi = calc_phi(n)
    if is_permutation(n, phi):
        np = float(n)/phi
        if np < min_np:
            min_np = np
            print n, phi, np


