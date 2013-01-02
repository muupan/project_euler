
sum_last10 = 0

for i in 1..1000
	sum_last10 += (i ** i) % 10000000000
	#sum_last10 += i ** i if i < 10
	#sum_last10 += (i % 100) ** i if i >= 10
	#sum_last10 %= 10000000000
end

p sum_last10
