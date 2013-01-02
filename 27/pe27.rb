require 'prime'

def count_consecutive_primes(a, b)
	for n in 0..999 do
		return n unless Prime.prime?(n ** 2 + a * n + b)
	end
end

max_length = 0
max_product = 0
for a in -999..999 do
	for b in -999..999 do
		length = count_consecutive_primes(a, b)
		if max_length < length
			puts "a:#{a} b:#{b} length:#{length}"
			max_length = length
			max_product = a * b
		end
	end
end

puts "max length: #{max_length}"
puts "such product: #{max_product}"

