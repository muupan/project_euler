require 'set'

numbers = Set.new
for a in 2..100 do
	for b in 2..100 do
		numbers.add(a ** b)
	end
end

p numbers.size
