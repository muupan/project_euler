matrix = [[int(v) for v in line.rstrip().split(',')] for line in open('matrix.txt')]
assert len(matrix) == 80
assert len(matrix[0]) == 80

def memoize(f):
    table = {}
    def func(*args):
        if not args in table:
            table[args] = f(*args)
        return table[args]
    return func

@memoize
def shortest_path(col, row):
    if col == 0:
        path = [matrix[r][0] for r in xrange(0, row + 1)]
        cost = sum(path)
        return (path, cost)
    elif row == 0:
        path = [matrix[0][c] for c in xrange(0, col + 1)]
        cost = sum(path)
        return (path, cost)
    else:
        v_path, v_cost = shortest_path(col, row - 1)
        h_path, h_cost = shortest_path(col - 1, row)
        if v_cost < h_cost:
            path = v_path + [matrix[row][col]]
            cost = v_cost + matrix[row][col]
            return (path, cost)
        else:
            path = h_path + [matrix[row][col]]
            cost = h_cost + matrix[row][col]
            return (path, cost)

print shortest_path(79, 79)
