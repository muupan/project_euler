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
def shortest_path(col, row, allow_upward_path=True, allow_downward_path=True):
    if col == 0:
        path = [matrix[row][col]]
        cost = sum(path)
        return (path, cost)
    else:
        paths = []
        # to right
        paths.append(shortest_path(col - 1, row))
        if row < 79 and allow_upward_path:
            # to upper
            paths.append(shortest_path(col, row + 1, True, False))
        if row > 0 and allow_downward_path:
            # to lower
            paths.append(shortest_path(col, row - 1, False, True))
        path, cost = min(paths, key=lambda path_and_cost: path_and_cost[1])
        return (path + [matrix[row][col]], cost + matrix[row][col])

paths = [shortest_path(79, r) for r in xrange(0, 80)]
print min(paths, key=lambda path_and_cost: path_and_cost[1])

