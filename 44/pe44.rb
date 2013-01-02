require 'set'

$pentagonal_cache = {}
$pentagonals = Set.new

for n in 1..10000 do
	$pentagonal_cache[n] = n * (3 * n - 1) / 2
	$pentagonals.add($pentagonal_cache[n])
end

puts "Pentagonal cache was created."

def pentagonal(n)
	$pentagonal_cache[n]
end

def is_pentagonal(n)
	$pentagonals.include?(n.abs)
end

last_distance = Hash.new(1)

$pentagonals.sort.each do |d|
	for j in 1...10000 do
		for k in (j + last_distance[j])..10000 do
			if is_pentagonal(pentagonal(k) + pentagonal(j)) && pentagonal(k) - pentagonal(j) == d then
				puts "Pair of k=#{k} and j=#{j} minimises D into #{d}"
				exit
			elsif pentagonal(k) - pentagonal(j) > d
				last_distance[j] = k - j
				break
			end
		end
	end
	puts "D > #{d}"
end

# P(n+1) - P(n) = (n+1)(3n+2)/2 - n(3n-1)/2 = (n(6n+1) + 3n + 2) / 2 = 3n^2 + 2n + 1
