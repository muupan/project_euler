length = 0
ds = []

for i in 1...1000000 do
	next_length = length + i.to_s.length
	if length < 1 && next_length >= 1 then
		ds << i.to_s[(1 - length) - 1].to_i
	elsif length < 10 && next_length >= 10 then
		ds << i.to_s[(10 - length) - 1].to_i
	elsif length < 100 && next_length >= 100 then
		ds << i.to_s[(100 - length) - 1].to_i
	elsif length < 1000 && next_length >= 1000 then
		ds << i.to_s[(1000 - length) - 1].to_i 
	elsif length < 10000 && next_length >= 10000 then
		ds << i.to_s[(10000 - length) - 1].to_i
	elsif length < 100000 && next_length >= 100000 then
		ds << i.to_s[(100000 - length) - 1].to_i
	elsif length < 1000000 && next_length >= 1000000 then
		ds << i.to_s[(1000000 - length) - 1].to_i
		break
	end
	length = next_length
end

p ds
p ds.inject(:*)
