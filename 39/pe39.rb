max_solution_num = 0
such_p = 0

for p in 3..1000 do
	solution_num = 0
	for c in (p / 3)..(p - 2) do
		for b in ((p - c) / 2)..[c, p - c - 1].min do
			a = p - c - b
			next if b < a
			if a ** 2 + b ** 2 == c ** 2 then
				solution_num += 1
			end
		end
	end
	if solution_num > max_solution_num then
		max_solution_num = solution_num
		such_p = p
	end
end

puts such_p
