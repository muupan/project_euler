def recur_cycle_length(dividend, divisor)
	remainders = []
	remainder = dividend
	loop do
		remainder %= divisor
		if remainder == 0 then
			# no recur cycle
			return 0
		end
		if remainders.rindex(remainder) != nil then
			return remainders.size - remainders.rindex(remainder)
		end
		remainders << remainder
		remainder *= 10
	end
end

max_length = 0
max_d = 1
for d in 1..999 do
	len = recur_cycle_length(1, d)
	if max_length < len then
		max_length = len
		max_d = d
	end
end

p "max recurring cycle length: #{max_length}"
p "such d: #{max_d}"

