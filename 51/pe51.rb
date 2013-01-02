require 'prime'

class Array
	def all_index(obj)
		return self.each_with_index.select{|x| x[0] == obj}.map{|x| x[1]}
	end
end

Prime.each do |prime|
	next if prime < 10
	prime_chars = prime.to_s.split("")
	prime_chars.uniq.each do |c|
		indexes = prime_chars.all_index(c)
		1.upto(prime_chars.count(c)).each do |digit_num_to_replace|
			indexes.combination(digit_num_to_replace) do |indexes_to_replace|
				composite_count = 0
				1.upto(9).each do |replace_with|
					replaced = prime_chars.each_with_index.map{|c, i| indexes_to_replace.include?(i) ? replace_with : c}.join("").to_i
					composite_count += 1 unless Prime.prime?(replaced)
					break if composite_count > 1
				end
				if composite_count <= 1 then
					p prime
					p c
					p indexes_to_replace
					exit
				end
			end
		end
	end
end


