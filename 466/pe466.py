import itertools

def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

@memoize
def gcd(a, b):
    if b == 0:
        return a
    else:
        return gcd(b, a % b)

@memoize
def lcm(a, b):
        return a * b / gcd(a, b)

def reduce_by_lcm(ns):
    return reduce(lambda a, b: lcm(a, b), ns)

def count_numbers_that_cannot_be_divided_by_any(n, factors):
    phi = n
    factors = sorted(factors)
    for product_size in xrange(1, len(factors) + 1):
        print "size:", product_size
        for comb in itertools.combinations(factors, product_size):
            # composite = reduce(lambda a, b: lcm(a, b), comb)
            composite = reduce_by_lcm(tuple(comb))
            if product_size % 2 == 1:
                phi -= n / composite
            else:
                phi += n / composite
    return phi

def calc_P_naive(m, n):
    terms = set()
    for row in xrange(1, m + 1):
        for col in xrange(1, n + 1):
            terms.add(row * col)
    return len(terms)

def slim_factors(factors):
    new_factors = []
    for factor in factors:
        needed = True
        for another in factors:
            if factor != another and factor % another == 0:
                needed = False
                break
        if needed:
            new_factors.append(factor)
    return new_factors

def calc_P(m, n):
    count = 0
    for row in xrange(1, m + 1):
        factors = range(row + 1, m + 1)
        factors = slim_factors(set([factor / gcd(row, factor) for factor in factors]))
        print factors
        count += count_numbers_that_cannot_be_divided_by_any(n, factors)
        print row, count
    return count

print calc_P(64, 10 ** 16)

