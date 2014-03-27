import math

def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

@memoize
def calc_digit_factorial(n):
    return sum([math.factorial(int(c)) for c in list(str(n))])

def generate_digit_factorial_chain(n):
    chain = [n]
    while True:
        next_elem = calc_digit_factorial(chain[-1])
        if next_elem in chain:
            return chain
        else:
            chain.append(next_elem)

chain_with_60_terms = 0
for n in xrange(1, 10 ** 6):
    chain = generate_digit_factorial_chain(n)
    if len(chain) == 60:
        print chain
        chain_with_60_terms += 1

print chain_with_60_terms
