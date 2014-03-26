import fractions

def get_nth_convergent(n):
    sequence = [ 2 * (i / 3 + 1) if i % 3 == 1 else 1 for i in xrange(n - 1)]
    r = fractions.Fraction(0)
    for n in reversed(sequence):
        r = fractions.Fraction(numerator=1, denominator=n+r)
    return 2 + r

def get_digits_sum(n):
    return sum([int(c) for c in list(str(n))])

if __name__ == '__main__':
    print get_digits_sum(get_nth_convergent(10).numerator)
    print get_digits_sum(get_nth_convergent(100).numerator)

