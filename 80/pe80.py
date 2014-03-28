import math
import decimal

def sum_of_decimal_digits_of_sqrt(n):
    digits = list(str(decimal.Decimal(n).sqrt()).replace('.', ''))[:digit_count]
    print "n:", n
    print "digits:", digits
    # print len(digits)
    return sum([int(c) for c in digits])


max_n = 100
squares = [n ** 2 for n in xrange(1, int(math.sqrt(max_n)) + 1)]

digit_count = 100
decimal.getcontext().prec = digit_count + 10

assert sum_of_decimal_digits_of_sqrt(2) == 475

total = 0
for n in xrange(1, max_n + 1):
    if n not in squares:
        total += sum_of_decimal_digits_of_sqrt(n)
print total



