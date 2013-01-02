fractions = []

for common_digit in 1..9 do
	for numerator_digit in 1..9 do
		[common_digit * 10 + numerator_digit, numerator_digit * 10 + common_digit].each do |numerator|
			for denominator_digit in 1..9 do
				[common_digit * 10 + denominator_digit, denominator_digit * 10 + common_digit].each do |denominator|
					break if numerator >= denominator
					fraction = Rational(numerator, denominator)
					fractions << fraction if fraction == Rational(numerator_digit, denominator_digit)
				end
			end
		end
	end
end

p fractions
p fractions.inject(:*).denominator

