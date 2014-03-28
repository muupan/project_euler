import sys

def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func


@memoize
def calc_partition(n):
    if n == 0:
        return 1
    k = 1
    s = 0
    while True:
        g = k * (3 * k - 1) / 2
        if n - g < 0:
            break
        if k % 2 == 1:
            s += calc_partition(n - g)
        else:
            s -= calc_partition(n - g)
        k += 1
    k = -1
    while True:
        g = k * (3 * k - 1) / 2
        if n - g < 0:
            break
        if k % 2 == 1:
            s += calc_partition(n - g)
        else:
            s -= calc_partition(n - g)
        k -= 1
    return s


# sys.setrecursionlimit(10000)
n = 1
while True:
    count = calc_partition(n)
    print n, count
    if count % 1000000 == 0:
        break
    n += 1
