n1 = 0
n2 = 1
term = 1

while n2.to_s.size < 1000 do
	temp = n2
	n2 = n1 + n2
	n1 = temp
	term += 1
end

p n2
p term
