import itertools

def make_ring(outer_nodes, inner_nodes):
    assert len(outer_nodes) == len(inner_nodes)
    gon = len(outer_nodes)
    buf = []
    for i in xrange(0, gon):
        buf.append(outer_nodes[i])
        buf.append(inner_nodes[i])
        if i == gon - 1:
            buf.append(inner_nodes[0])
        else:
            buf.append(inner_nodes[i+1])
    return "".join([str(n) for n in buf])

def get_all_rings_for_fixed_outer_nodes(ns, gon, outer_nodes):
    result = []
    for total in xrange(max(outer_nodes) + ns[0] * 2, min(outer_nodes) + ns[-1] * 2 + 1):
        # print "total:", total
        first_inner_node_min = max([ns[0], total - outer_nodes[0] - ns[-1]])
        first_inner_node_max = min([ns[-1], total - outer_nodes[0] - ns[0]])
        for first_inner_node in xrange(first_inner_node_min, first_inner_node_max + 1):
            # print "first_inner_node:", first_inner_node
            if first_inner_node in outer_nodes:
                continue
            inner_nodes = [first_inner_node]
            for i in xrange(0, gon):
                if outer_nodes[i] == inner_nodes[-1]:
                    break
                new_node = total - outer_nodes[i] - inner_nodes[-1]
                if new_node not in ns:
                    break
                if new_node in outer_nodes:
                    break
                if new_node == inner_nodes[-1]:
                    break
                if new_node in inner_nodes[1:]:
                    break
                inner_nodes.append(new_node)
            if len(inner_nodes) == gon + 1 and inner_nodes[0] == inner_nodes[-1]:
                result.append(make_ring(outer_nodes, inner_nodes[0:-1]))
    return result

def get_all_ring(ns, gon):
    result = []
    for min_outer_node in ns:
        for other_outer_nodes in itertools.permutations([n for n in ns if n > min_outer_node], gon - 1):
            outer_nodes = [min_outer_node] + list(other_outer_nodes)
            result = result + get_all_rings_for_fixed_outer_nodes(ns, gon, outer_nodes)
    return result

if __name__ == '__main__':
    rings = [ring for ring in get_all_ring(range(1, 11), 5) if len(ring) == 16]
    print "rings:", rings
    print "max ring:", max(rings)

