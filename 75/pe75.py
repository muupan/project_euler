import fractions

max_length = 1500000
# max_length = 120
right_triangle_count = {}

# Generate all unique pythagorean triples under 1500000
for m in xrange(1, max_length - 1):
    l_lowerbound = 2 * m * (m + 1)
    if l_lowerbound > max_length:
        break
    for n in xrange(1, m):
        if fractions.gcd(m, n) != 1 or (m - n) % 2 == 0:
            continue
        l = 2 * m * (m + n)
        if l > max_length:
            break
        k = 1
        while True:
            kl = k * l
            if kl > max_length:
                break
            if kl in right_triangle_count:
                right_triangle_count[kl] += 1
            else:
                right_triangle_count[kl] = 1
            k += 1

print len([k for (k, v) in right_triangle_count.iteritems() if v == 1])
