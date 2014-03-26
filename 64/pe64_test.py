import unittest
import pe64

class PE64TestCase(unittest.TestCase):
    def test_fraction1(self):
        f = pe64.Fraction(0, 1, 23, -4)
        g = f.rationalize()
        print g
        self.assertTrue(g == pe64.Fraction(23, 4, 0, 7))
        i, h = g.disjoin()
        self.assertTrue(i == 1)
        print h
        self.assertTrue(h == pe64.Fraction(23, -3, 0, 7))

    def test_fraction2(self):
        f = pe64.Fraction(0, 7, 23, -3)
        g = f.rationalize()
        print g
        self.assertTrue(g == pe64.Fraction(23, 3, 0, 2))
        i, h = g.disjoin()
        self.assertTrue(i == 3)
        print h
        self.assertTrue(h == pe64.Fraction(23, -3, 0, 2))

    def test_get_period(self):
        self.assertTrue(pe64.get_period(2) == 1)
        self.assertTrue(pe64.get_period(3) == 2)
        self.assertTrue(pe64.get_period(5) == 1)
        self.assertTrue(pe64.get_period(6) == 2)
        self.assertTrue(pe64.get_period(7) == 4)
        self.assertTrue(pe64.get_period(8) == 2)
        self.assertTrue(pe64.get_period(10) == 1)
        self.assertTrue(pe64.get_period(11) == 2)
        self.assertTrue(pe64.get_period(12) == 2)
        self.assertTrue(pe64.get_period(13) == 5)

if __name__ == '__main__':
    unittest.main()
