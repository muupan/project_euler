import math
import sys
from scipy.misc import comb
from timeit import default_timer

class Timer(object):
    def __init__(self, verbose=True):
        self.verbose = verbose
        self.timer = default_timer
    def __enter__(self):
        self.start = self.timer()
        return self
    def __exit__(self, *args):
        end = self.timer()
        self.elapsed_secs = end - self.start
        self.elapsed = self.elapsed_secs * 1000  # millisecs
        if self.verbose:
            print 'elapsed time: %f ms' % self.elapsed

def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

def int_log(n, base):
    tmp = int(math.log(n, base))
    power = base ** tmp
    if power * base <= n:
        return tmp + 1
    elif power > n:
        return tmp - 1
    else:
        # base ** tmp < n < base ** (tmp + 1)
        return tmp

@memoize
def calc_F_recursive(m, n, min_elem):
    # print m, n, min_elem
    if m < min_elem ** n:
        return 0
    elif n == 1:
        # min_elem, ..., m
        return m - min_elem + 1
    elif m < min_elem ** (n - 1) * (min_elem + 1):
        # [min_elem] * n
        return 1
    else:
        F = 1 # [min_elem] * n
        for over_mins in xrange(1, min(n, int_log(m, min_elem + 1)) + 1):
            over_min_allocations = comb(n, over_mins, exact=True)
            count = calc_F_recursive(m / (min_elem ** (n - over_mins)), over_mins, min_elem + 1)
            F += over_min_allocations * count
        return F

max_recursive_size = 10 ** 6

def calc_F(m, n):
    F = 0
    stack = [(m, n, 1, 1)]
    while stack:
        # print len(stack)
        m, n, min_elem, coef = stack.pop()
        if m <= max_recursive_size and n <= max_recursive_size and min_elem <= max_recursive_size:
            F += calc_F_recursive(m, n, min_elem) * coef
            continue
        if m < min_elem ** n:
            continue
        elif n == 1:
            # min_elem, ..., m
            F += (m - min_elem + 1) * coef
        elif m < min_elem ** (n - 1) * (min_elem + 1):
            # [min_elem] * n
            F += coef
        else:
            F += coef # [min_elem] * n
            for over_mins in xrange(1, min(n, int_log(m, min_elem + 1)) + 1):
                over_min_allocations = comb(n, over_mins, exact=True)
                stack.append((m / (min_elem ** (n - over_mins)), over_mins, min_elem + 1, coef * over_min_allocations))
        F %= 1234567891
    return F

sys.setrecursionlimit(10 ** 7)

with Timer():
    print "F(10, 10) =", calc_F(10, 10)
with Timer():
    print "F(10^6, 10^6) mod 1234567891 =", calc_F(10 ** 6, 10 ** 6) % 1234567891
with Timer():
    print "F(10^9, 10^9) mod 1234567891 =", calc_F(10 ** 9, 10 ** 9) % 1234567891

