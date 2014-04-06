squares = set([n ** 2 for n in xrange(1, 100000)])
print "is_square(n) is ready."

def is_square(n):
    return n in squares

def find_M(solutions):
    count = 0
    M = 1
    while True:
        for w in xrange(1, M + 1):
            for h in xrange(w, M + 1):
                if is_square((w + h) ** 2 + M ** 2):
                    count += 1
        print "M:", M, "count:", count
        if count > solutions:
            return M
        M += 1

print find_M(2000)
print find_M(1000000)
