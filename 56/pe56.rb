class Integer
	def sum_of_digits
		self.to_s.split("").map{|s| s.to_i}.inject(:+)
	end
end

max = 0
for a in 1..99 do
	for b in 1..99 do
		sum = (a ** b).sum_of_digits
		max = sum if sum > max
	end
end

p max
