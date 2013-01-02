require 'prime'
require 'set'

written = Set.new

Prime.each do |prime|
	break if prime > 10000
	for i in 1...10000 do
		written.add(prime + 2 * (i ** 2))
	end
end

puts "Written numbers were calculated."

for n in 3...1000000 do
	next if n % 2 == 0 || Prime.prime?(n)
	unless written.include?(n) then
		puts "#{n} is cannot be written."
		exit
	end
end

