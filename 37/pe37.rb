require 'prime'

def is_truncatable(prime)
	return false if prime < 10
	for i in 1...prime.to_s.length do
		return false unless Prime.prime?(prime.to_s.slice(i, prime.to_s.length - i).to_i) # from left
		return false unless Prime.prime?(prime.to_s.slice(0, prime.to_s.length - i).to_i) # from right
	end
	return true
end

truncatables = []

Prime.each do |prime|
	truncatables << prime if is_truncatable(prime)
	break if truncatables.size == 11
end

p truncatables
p truncatables.inject(:+)

