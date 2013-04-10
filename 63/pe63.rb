def find_powerful_digit(n)
	powered = 1
	powered += 1 while powered ** n < 10 ** (n - 1)
	count = 0
	while powered ** n < 10 ** n
		puts "#{powered}^#{n}=#{powered ** n}"
		count += 1
		powered += 1
	end
	return count
end

powerfuls = 1.upto(100).map{|i| find_powerful_digit(i)}
p powerfuls.inject(:+)
