import itertools

# Generate all the possible arrangements of digits on a cube
# that can display all the given digits
def generate_arrangements(numbers_to_be_displayed):
    arrangements = set()
    for digits in itertools.combinations(range(0, 9 + 1), 6):
        expanded_digits = set(digits)
        if 6 in digits and 9 not in digits:
            expanded_digits.add(9)
        elif 9 in digits and 6 not in digits:
            expanded_digits.add(6)
        if all(n in expanded_digits for n in numbers_to_be_displayed):
            arrangements.add(tuple(digits))
    return arrangements

# 01 -> [0, 1], 81 -> [8, 1]
def divide_number(n):
    if n < 10:
        return [0, n]
    else:
        return [int(c) for c in list(str(n))]

number_pairs = [divide_number(n ** 2) for n in xrange(1, 9 + 1)]

arrangements = set()
# Iterate from 000000000 to 111111111.
# 1 bit means left digit will be allocated to left cube.
for digit_allocation in xrange(0, 2 ** 9):
    left_digits = []
    right_digits = []
    for i in xrange(0, 9):
        if digit_allocation & (2 ** i):
            left_digits.append(number_pairs[i][0])
            right_digits.append(number_pairs[i][1])
        else:
            left_digits.append(number_pairs[i][1])
            right_digits.append(number_pairs[i][0])
    print "allocation:", left_digits, right_digits
    left_arrangements = generate_arrangements(left_digits)
    print "left:", left_arrangements
    right_arrangements = generate_arrangements(right_digits)
    print "right:", right_arrangements
    for left_arrangement in left_arrangements:
        for right_arrangement in right_arrangements:
            first = min([left_arrangement, right_arrangement])
            second = max([left_arrangement, right_arrangement])
            arrangements.add((first, second))

print len(arrangements)

