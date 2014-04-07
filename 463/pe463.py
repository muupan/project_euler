def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

@memoize
def calc_f(n):
    if n == 1:
        return 1
    elif n == 3:
        return 3
    elif n % 2 == 0:
        return calc_f(n / 2) % 10 ** 9
    elif n % 4 == 1:
        m = n / 4
        return 2 * calc_f(2 * m + 1) - calc_f(m) % 10 ** 9
    else:
        assert n % 4 == 3
        m = n / 4
        return 3 * calc_f(2 * m + 1) - 2 * calc_f(m) % 10 ** 9

def calc_S_naive(n):
    return sum([calc_f(m) for m in xrange(1, n + 1)])

@memoize
def calc_S_odd(n):
    return calc_S_4n1(n) + calc_S_4n3(n)

@memoize
def calc_S_4n3(n):
    if n <= 2:
        return 0
    elif n <= 6:
        return 3
    else:
        m = (n - 3) / 4
        return 3 * (calc_S_odd(2 * m + 1) - 1) - 2 * calc_S(m) + 3

@memoize
def calc_S_4n1(n):
    if n <= 4:
        return 1
    else:
        m = (n - 1) / 4
        return 2 * (calc_S_odd(2 * m + 1) - 1) - calc_S(m) + 1

@memoize
def calc_S_even(n):
    if n <= 1:
        return 0
    elif n <= 3:
        return 1
    else:
        return calc_S(n/2)

@memoize
def calc_S(n):
    return calc_S_odd(n) + calc_S_even(n)

assert calc_S(8) == 22
assert calc_S(100) == 3604

for n in xrange(1, 1000):
    assert calc_S(n) == calc_S_naive(n)

print calc_S(3 ** 37) % 10 ** 9
