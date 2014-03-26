import gmpy
import math
import fractions

class RationalPlusSqrt(object):
    """
    = s + t * sqrt(d)
    """
    def __init__(self, s, t, d):
        self.s = fractions.Fraction(s)
        self.t = fractions.Fraction(t)
        self.d = d
    def __add__(self, other):
        if isinstance(other, RationalPlusSqrt):
            assert(self.d == other.d)
            return RationalPlusSqrt(self.s + other.s, self.t + other.t, self.d)
        else:
            return RationalPlusSqrt(self.s + other, self.t, self.d)
    def __neg__(self):
        return RationalPlusSqrt(-self.s, -self.t, self.d)
    def __sub__(self, other):
        return self + (-other)
    def inverse(self):
        """
        1 / (s + t * sqrt(d))
        = (s - t * sqrt(d)) / (s**2 - t**2 * d)
        = (s / (s**2 - t**2 * d)) - (t / (s**2 - t**2 * d)) * sqrt(d)
        """
        c = self.s**2 - self.t**2 * self.d
        # print "inverse from", self
        inv = RationalPlusSqrt(self.s / c, -self.t / c, self.d)
        # print "inverse to:", inv
        assert(abs(1/float(self) - float(inv)) < 0.00001)
        return inv
    def __float__(self):
        return self.s + self.t * math.sqrt(d)
    def __int__(self):
        return int(float(self))
    def __eq__(self, other):
        return self.s == other.s and self.t == other.t and self.d == other.d
    def __str__(self):
        return "%f + %f * sqrt(%d)" % (self.s, self.t, self.d)

def is_diophantine_solution(d, x):
    tmp = x ** 2 - 1
    if tmp % d != 0:
        return False
    return tmp / d > 0 and gmpy.is_square(tmp / d)

def pells_reccurence(x_n_minus_1, q_n_minus_1, P_n_minus_1, P_n_minus_2, Q_n_minus_1, Q_n_minus_2):
    # x_n = 1 / (x_n_minus_1 - q_n_minus_1)
    x_n = (x_n_minus_1 - q_n_minus_1).inverse()
    q_n = int(x_n)
    P_n = q_n * P_n_minus_1 + P_n_minus_2
    Q_n = q_n * Q_n_minus_1 + Q_n_minus_2
    return (x_n, q_n, P_n, P_n_minus_1, Q_n, Q_n_minus_1)

def solve_pells_equation(d):
    print "solving d=%d" % d
    q_0 = int(math.sqrt(d))
    # x_1 = 1 / (math.sqrt(d) - q_0)
    x_1 = RationalPlusSqrt(-q_0, 1, d).inverse()
    print "\tx_1=%s" % x_1
    # when n = 1
    n = 1
    x_n = x_1
    q_n = int(x_n)
    P_n_minus_2 = 1
    P_n_minus_1 = q_0
    P_n = q_n * P_n_minus_1 + P_n_minus_2
    Q_n_minus_2 = 0
    Q_n_minus_1 = 1
    Q_n = q_n * Q_n_minus_1 + Q_n_minus_2
    while True:
        P_n_minus_2 = P_n_minus_1
        Q_n_minus_2 = Q_n_minus_1
        x_n, q_n, P_n, P_n_minus_1, Q_n, Q_n_minus_1 = pells_reccurence(x_n, q_n, P_n, P_n_minus_1, Q_n, Q_n_minus_1)
        n = n + 1
        print "\tx_n=%s" % x_n
        if x_n == x_1:
            # n == k + 1
            # k = n - 1
            # x = P_k_minus_1 = P_n_minus_2
            P = P_n_minus_2
            Q = Q_n_minus_2
            if P**2 - d * Q**2 == 1:
                return P
            else:
                assert(P**2 - d * Q**2 == -1)
                return P**2 + d * Q**2

if __name__ == '__main__':
    max_d = 1000
    solutions = [(d, solve_pells_equation(d)) for d in xrange(1, max_d + 1) if not gmpy.is_square(d)]
    print max(solutions, key=lambda x: x[1])

