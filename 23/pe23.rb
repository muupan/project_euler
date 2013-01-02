$abundants = []

def is_abundant(n)
	sum_of_divisor = 0
	for i in 1..[1, n / 2].max do
		sum_of_divisor += i if n % i == 0
	end
	return sum_of_divisor > n
end

for i in 1..28123 do
	$abundants << i if is_abundant(i)
end

def is_sum_of_abundants(n)
	for a1 in 0...$abundants.size do
		break if $abundants[a1] * 2 > n
		for a2 in a1...$abundants.size do
			break if $abundants[a1] + $abundants[a2] > n
			return true if $abundants[a1] + $abundants[a2] == n
		end
	end
	return false
end

$not_sum_of_abundants = []

for i in 1..28123 do
	$not_sum_of_abundants << i unless is_sum_of_abundants(i)
	puts "#{i} done."
end

p $abundants
p $not_sum_of_abundants
p $not_sum_of_abundants.inject(:+)
