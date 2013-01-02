n = 2 ** 1000
str = n.to_s
sum = 0
for i in 0..(str.size)
	sum += str[i].to_i
end
puts sum
