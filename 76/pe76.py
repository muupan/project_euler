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
        return [[1]]
    elif upper_bound == 1:
        return [[1] * n]
    total = [] 
    if n <= upper_bound:
        total.append([n])
    for max_elem in xrange(1, min([n, upper_bound + 1])):
        for summation in divide_into_summations(n - max_elem, min([n - max_elem, max_elem])):
            total.append([max_elem] + summation)
    return total

@memoize
def count_summations(n, upper_bound):
    if n == 1:
        return 1
    elif upper_bound == 1:
        return 1
    total = 0
    if n <= upper_bound:
        total += 1
    for max_elem in xrange(1, min([n, upper_bound + 1])):
        total += count_summations(n - max_elem, min([n - max_elem, max_elem]))
    return total

print divide_into_summations(5, 4)
print count_summations(5, 4)
print count_summations(100, 99)

