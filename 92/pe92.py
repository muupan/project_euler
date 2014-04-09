def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

def calc_next_chain(n):
    return sum([int(c) ** 2 for c in list(str(n))])

@memoize
def arrives_at_89(n):
    if n == 1:
        return False
    elif n == 89:
        return True
    else:
        return arrives_at_89(calc_next_chain(n))

assert not arrives_at_89(44)
assert arrives_at_89(85)

count = 0
for n in xrange(1, 10 ** 7):
    if n % 1000 == 0:
        print n, count
    if arrives_at_89(n):
        count += 1
print count
