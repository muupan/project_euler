first_term = Rational(1, 1)
second_term = Rational(1, 2)

fractions = []

1000.times do
	frac = first_term + second_term
	fractions << frac if frac.numerator.to_s.size > frac.denominator.to_s.size
	second_term = 1 / (2 + second_term)
end

p fractions
p fractions.size


