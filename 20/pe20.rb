str = (1..100).inject(:*).to_s
sum = 0
for i in 0...str.size do
	sum += str[i].to_i
end
puts sum
