seqs = {1 => 1}
longest_num = 1
longest_seq = 1

def calc_seq(n, seqs)
	if seqs.key?(n) then
		return seqs[n]
	elsif n % 2 == 0 then
		seq = 1 + calc_seq(n / 2, seqs)
	else
		seq = 1 + calc_seq(n * 3 + 1, seqs)
	end
	seqs[n] = seq
	return seq
end

for i in 1..1000000
	seq = calc_seq(i, seqs)
	if seq > longest_seq then
		longest_seq = seq
		longest_num = i
	end
end

puts longest_num
puts longest_seq

