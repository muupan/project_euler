def has_no_redundant_number(n, digit_num)
	chars = sprintf("%0#{digit_num}d", n).split("")
	return chars == chars.uniq
end

def to_3digits(n)
	return sprintf("%03d", n)
end

def to_9digits(n)
	return sprintf("%09d", n)
end

def are_overlapping(first, second)
	return to_3digits(first)[1, 2] == to_3digits(second)[0, 2]
end

def are_overlapping_and_no_redundant_number(first, second)
	return are_overlapping(first, second) && to_3digits(second).index(to_3digits(first)[0]) == nil
end

def add_first_nonredundant_digit(n2_10)
	for digit in 0..9 do
		return (digit.to_s + to_9digits(n2_10)).to_i if to_9digits(n2_10).index(digit.to_s) == nil
	end
end

d234 = 1.upto(999).select{|n| n % 2 == 0 && has_no_redundant_number(n, 3)}
d345 = 1.upto(999).select{|n| n % 3 == 0 && has_no_redundant_number(n, 3)}
d456 = 1.upto(999).select{|n| n % 5 == 0 && has_no_redundant_number(n, 3)}
d567 = 1.upto(999).select{|n| n % 7 == 0 && has_no_redundant_number(n, 3)}
d678 = 1.upto(999).select{|n| n % 11 == 0 && has_no_redundant_number(n, 3)}
d789 = 1.upto(999).select{|n| n % 13 == 0 && has_no_redundant_number(n, 3)}
d8910 = 1.upto(999).select{|n| n % 17 == 0 && has_no_redundant_number(n, 3)}

d2_10 = []
d8910.each do |n8910|
	d789.select{|n| are_overlapping_and_no_redundant_number(n, n8910)}.each do |n789|
		d678.select{|n| are_overlapping_and_no_redundant_number(n, n789)}.each do |n678|
			d567.select{|n| are_overlapping_and_no_redundant_number(n, n678)}.each do |n567|
				d456.select{|n| are_overlapping_and_no_redundant_number(n, n567)}.each do |n456|
					d345.select{|n| are_overlapping_and_no_redundant_number(n, n456)}.each do |n345|
						d234.select{|n| are_overlapping_and_no_redundant_number(n, n345)}.each do |n234|
							n2_10 = (to_3digits(n234) + to_3digits(n567) + to_3digits(n8910)).to_i
							d2_10 << n2_10 if to_9digits(n2_10).index("0") != nil && has_no_redundant_number(n2_10, 9)
						end
					end
				end
			end
		end
	end
end

d1_10 = d2_10.collect{|n| add_first_nonredundant_digit(n)}
p d1_10
p d1_10.inject(:+)


