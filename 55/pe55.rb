def is_palindromic(n)
	return n.to_s == n.to_s.reverse
end

def reverse_and_add(n)
	return n + n.to_s.reverse.to_i
end

def is_lychrel(n)
	tmp = n
	50.times do
		tmp = reverse_and_add(tmp)
		return false if is_palindromic(tmp)
	end
	return true
end

lychrels = []

for n in 1...10000 do
	lychrels << n if is_lychrel(n)
end

p lychrels
p lychrels.size

