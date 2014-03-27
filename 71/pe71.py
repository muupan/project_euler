from fractions import Fraction

print "Project Euler 71"

def search_bigger_one(current_biggest, upper_bound, max_denominator):
    print "search_bigger_one:", current_biggest
    bigger_one = Fraction(current_biggest.numerator + 1, current_biggest.denominator)
    seen = [bigger_one]
    while True:
        print "bigger_one:", bigger_one
        if bigger_one <= current_biggest:
            while bigger_one in seen:
                bigger_one = Fraction(bigger_one.numerator + 1, bigger_one.denominator)
                print "increment numerator:", bigger_one
        elif bigger_one >= upper_bound:
            while bigger_one in seen and bigger_one < upper_bound:
                bigger_one = Fraction(bigger_one.numerator, bigger_one.denominator + 1)
                print "increment denominator:", bigger_one
        else:
            print "break"
            break
        seen.append(bigger_one)
    if bigger_one.denominator > max_denominator:
        return None
    else:
        return bigger_one

lower_bound = Fraction(2, 5)
upper_bound = Fraction(3, 7)
# print lower_bound
# while True:
#     bigger_one = search_bigger_one(lower_bound, Fraction(3, 7), 10 ** 6)
#     print bigger_one
#     if bigger_one is None:
#         break
#     else:
#         lower_bound = bigger_one

# while lower_bound.denominator <= 10 ** 6:
#     print lower_bound
#     lower_bound = (lower_bound + upper_bound) / 2

# print Fraction(428571, 1000000)

biggest = 0
for denominator in xrange(1, 10 ** 6 + 1):
    frac = Fraction(denominator * 3 / 7, denominator)
    if frac > biggest and frac < Fraction(3, 7):
        biggest = frac
        print biggest

