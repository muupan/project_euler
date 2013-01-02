require 'prime'

def is_circular_prime(prime)
	prime_chars = prime.to_s.split("")
	for i in 1...prime_chars.size do
		return false unless Prime.prime?(prime_chars.rotate(i).join("").to_i)
	end
	return true
end

circular_primes = []

Prime.each do |prime|
	break if prime >= 1000000
	circular_primes << prime if is_circular_prime(prime)
end

p circular_primes
p circular_primes.size

