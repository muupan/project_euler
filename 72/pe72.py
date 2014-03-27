from sympy import ntheory
import itertools

print "Project Euler 72"

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

count = 0
for d in xrange(2, 10 ** 6 + 1):
    count += calc_phi(d)

print count
