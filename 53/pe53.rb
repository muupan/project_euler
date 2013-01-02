def com(n, r)
	@cache ||= []
	@cache[n] ||= []
	return @cache[n][r] ||= (n == r || r == 0) ? 1 : com(n - 1, r - 1) + com(n - 1, r)
end

count = 0
for n in 1..100 do
	for r in 0..n do
		count += 1 if com(n, r) > 1000000
	end
end

p count
