require 'prime'

def is_pandigital(n)
	return n.to_s.split("").sort.join("") == 1.upto(n.to_s.length).inject(""){|sum, i| sum + i.to_s}
end

Prime.each do |prime|
	break if prime >= 1000000000
	p prime if is_pandigital(prime)
end

