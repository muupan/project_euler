palindromics = []

for n in 1...1000000 do
	palindromics << n if n.to_s == n.to_s.reverse && n.to_s(2) == n.to_s(2).reverse
end

p palindromics
p palindromics.inject(:+)

