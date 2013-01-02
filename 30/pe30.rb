numbers = []

for n in 2..999999
	numbers << n if n == n.to_s.split("").inject(0){|sum, c| sum + c.to_i ** 5}
end

p numbers
puts "sum:#{numbers.inject(:+)}"
