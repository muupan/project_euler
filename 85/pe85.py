
def count_rectangles(width, height):
    count = 0
    for w in xrange(1, width + 1):
        horizontal_positions = width - w + 1
        for h in xrange(1, height + 1):
            vertical_positions = height - h + 1
            positions = horizontal_positions * vertical_positions
            # print w, h, positions
            count += positions
    return count

solutions = []

for w in xrange(100):
    for h in xrange(100):
        count = count_rectangles(w, h)
        solutions.append([w, h, count, abs(2000000 - count)])

print sorted(solutions, key=lambda x: x[3])[:10]
