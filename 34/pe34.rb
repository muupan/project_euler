answers = []

for n in 3..1000000
	answers << n if n.to_s.split("").collect{|item| item.to_i.downto(1).inject(1){|sum, i| sum * i}}.inject(:+) == n
end

p answers
p answers.inject(:+)
