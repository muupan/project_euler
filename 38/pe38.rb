
def is_pandigital(n)
	return n.to_s.split("").sort.join("") == "123456789"
end

def max_integer_of_n_chars(n)
	return 10 ** n - 1
end

max_pandigital = 123456789
for n in 2..9 do
	for common in 1..max_integer_of_n_chars(9 / n) do
		concatenated = 1.upto(n).inject(""){|sum, i| sum + (common * i).to_s}
		max_pandigital = concatenated.to_i if is_pandigital(concatenated.to_i) && concatenated.to_i > max_pandigital
	end
end

p max_pandigital
