def apply_condition(passcode, condition):
    # condition: (chars-that-come-before-c, c)
    offset = 0
    for c in condition[0]:
        if c not in passcode[offset:]:
            return []
        offset = passcode[offset:].index(c) + 1
    if condition[1] in passcode[offset:]:
        return [passcode]
    else:
        none_indices = [i for i, v in enumerate(passcode) if i >= offset and v is None]
        result = []
        for i in none_indices:
            new_passcode = passcode[:]
            new_passcode[i] = condition[1]
            result.append(new_passcode)
        return result

def apply_conditions(passcode, conditions):
    if len(conditions) == 1:
        return apply_condition(passcode, conditions[0])
    else:
        result = []
        for applied_code in apply_condition(passcode, conditions[0]):
            result.extend(apply_conditions(applied_code, conditions[1:]))
        return result

def attempt_to_conditions(attempt):
    conditions = []
    for i, c in enumerate(attempt):
        conditions.append((attempt[:i], c))
    return conditions

attempts = [list(line.rstrip()) for line in open('keylog.txt').readlines()]
conditions = []
for attempt in attempts:
    conditions.extend(attempt_to_conditions(attempt))

passcode_length = 3
while True:
    print "length:", passcode_length
    passcode = [None] * passcode_length
    applied = apply_conditions(passcode, conditions)
    if applied:
        print applied
        break
    passcode_length += 1
