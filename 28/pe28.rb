numbers = [1]

for i in 1..500 do
	step = 2 * i
	numbers << numbers.last + step
	numbers << numbers.last + step
	numbers << numbers.last + step
	numbers << numbers.last + step
end

p numbers
puts "sum:#{numbers.inject(:+)}"
