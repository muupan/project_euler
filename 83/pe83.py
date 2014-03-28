import sys

matrix = [[int(v) for v in line.rstrip().split(',')] for line in open('matrix.txt')]
assert len(matrix) == 80
assert len(matrix[0]) == 80

def adjacent_nodes(v):
    col, row = v
    result = []
    if col > 0:
        result.append((col - 1, row))
    if col < 79:
        result.append((col + 1, row))
    if row > 0:
        result.append((col, row - 1))
    if row < 79:
        result.append((col, row + 1))
    return result

Q = set([(col, row) for col in xrange(0, 80) for row in xrange(0, 80)])
d = {}
prev = {}
for v in Q:
    if v == (0, 0):
        d[v] = matrix[row][col]
    else:
        d[v] = sys.maxint

# Dijkstra's algorithm
while Q:
    u = min(Q, key=lambda v: d[v])
    Q.remove(u)
    for v in adjacent_nodes(u):
        v_col, v_row = v
        if d[v] > d[u] + matrix[v_row][v_col]:
            d[v] = d[u] + matrix[v_row][v_col]
            prev[v] = u

shortest_path = [(79, 79)]
while shortest_path[-1] in prev:
    shortest_path.append(prev[shortest_path[-1]])

print shortest_path
costs = [matrix[row][col] for col, row in shortest_path]
print costs
print sum(costs)





