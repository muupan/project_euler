require 'set'

$d = {1=>0}
$amicables = Set.new

def calc_d(n)
	if $d.key?(n) then
		puts "#{n}:#{$d[n]}"
		return $d[n]
	end
	sum = 0
	print "#{n}:"
	for i in 1..[1, n / 2].max do
		if n % i == 0 then
			sum += i
			print "#{i},"
			###if $d.key?(n / i) then
			###	$d[n] = sum + $d[n / i]
			###	return $d[n]
			###end
		end
	end
	puts sum
	$d[n] = sum
	return sum
end

for i in 2...10000 do
	next if $amicables.include?(i)
	di = calc_d(i)
	next if di < i
	if i == calc_d(di) and i != di then
		$amicables.add(i)
		$amicables.add(di) if di < 10000
	end
end

puts calc_d(6)
puts calc_d(28)
puts calc_d(496)
puts calc_d(220)
puts calc_d(284)
p $amicables
puts $amicables.inject(:+)

