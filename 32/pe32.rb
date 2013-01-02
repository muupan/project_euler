def prm_to_i(prm)
	return prm.inject(0){|sum, i| sum * 10 + i}
end

def is_prm_of(n, numbers)
	return n.to_s.length == numbers.size && n.to_s.split("").collect{|c| c.to_i}.sort == numbers.sort
end

products = []
one_to_nine = [1,2,3,4,5,6,7,8,9]

for a_num in 1..3 do
	one_to_nine.permutation(a_num).each do |a_prm|
		for b_num in a_num..((9 - a_num) / 2) do
			(one_to_nine - a_prm).permutation(b_num).each do |b_prm|
				product = prm_to_i(a_prm) * prm_to_i(b_prm)
				products << product if is_prm_of(product, one_to_nine - a_prm - b_prm)
			end
		end
	end
end

p products.uniq.inject(:+)

