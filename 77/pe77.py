from sympy import ntheory

print "Project Euler 77"

def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

@memoize
def divide_into_summations(n, upper_bound):
    if n == 1:
        return []
    total = [] 
    if n <= upper_bound and ntheory.primetest.isprime(n):
        total.append([n])
    for max_elem in ntheory.generate.primerange(2, min([n, upper_bound + 1])):
        for summation in divide_into_summations(n - max_elem, min([n - max_elem, max_elem])):
            total.append([max_elem] + summation)
    return total

@memoize
def count_summations(n, upper_bound):
    if n == 1:
        return 0
    total = 0
    if n <= upper_bound and ntheory.primetest.isprime(n):
        total += 1
    for max_elem in ntheory.generate.primerange(2, min([n, upper_bound + 1])):
        total += count_summations(n - max_elem, min([n - max_elem, max_elem]))
    return total

print divide_into_summations(10, 9)
print count_summations(10, 9)

n = 1
while True:
    count = count_summations(n, n - 1)
    print n, count
    if count >= 5000:
        break
    n += 1

