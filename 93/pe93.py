import itertools
import operator
import fractions

def make_functions(op0, op1, op2):
    functions = []
    functions.append(lambda a, b, c, d: op0(a, op1(b, op2(c, d))))
    functions.append(lambda a, b, c, d: op0(a, op1(op2(b, c), d)))
    functions.append(lambda a, b, c, d: op0(op1(a, b), op2(c, d)))
    functions.append(lambda a, b, c, d: op0(op1(a, op2(b, c)), d))
    functions.append(lambda a, b, c, d: op0(op1(op2(a, b), c), d))
    return functions

functions = []
operators = [operator.add, operator.sub, operator.mul, operator.div]
for op0, op1, op2 in itertools.product(operators, repeat=3):
    functions.extend(make_functions(op0, op1, op2))

def express(digits):
    values = set()
    for a, b, c, d in itertools.permutations([fractions.Fraction(n) for n in digits], 4):
        for func in functions:
            try:
                v = func(a, b, c, d)
                if v.denominator == 1 and v > 0:
                    values.add(int(v))
            except ZeroDivisionError:
                pass
    return values

def calc_first_non_expressible(digits):
    values = express(digits)
    v = 1
    while True:
        if v not in values:
            return v
        v += 1

print max([(a, b, c, d) for a, b, c, d in itertools.combinations(xrange(1, 10), 4)], key=lambda digits: calc_first_non_expressible(digits))

