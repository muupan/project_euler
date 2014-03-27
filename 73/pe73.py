from sympy import ntheory
import itertools

print "Project Euler 73"

def calc_phi(n):
    factors = ntheory.primefactors(n)
    phi = (n / 2 if n % 2 != 0 else n / 2 - 1) - (n / 3)
    for product_size in xrange(1, len(factors) + 1):
        for comb in itertools.combinations(factors, product_size):
            composite = reduce(lambda a, b: a * b, comb)
            multiples = (n / 2 if n % 2 != 0 else n / 2 - 1) / composite - (n / 3) / composite
            if product_size % 2 == 1:
                phi -= multiples
            else:
                phi += multiples
    return phi

count = 0
upper_bound = 12000
# upper_bound = 8
for d in xrange(2, upper_bound + 1):
    count += calc_phi(d)
    print d, count

print count
