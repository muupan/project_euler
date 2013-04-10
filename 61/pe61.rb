require 'set'

def triangle(n)
	return n * (n + 1) / 2
end

def square(n)
	return n * n
end

def pentagonal(n)
	return n * (3 * n - 1) / 2
end

def hexagonal(n)
	return n * (2 * n - 1)
end

def heptagonal(n)
	return n * (5 * n - 3) / 2
end

def octagonal(n)
	return n * (3 * n - 2)
end

def four_digits_polygonals(&polygonal_func)
	results = []

	n = 1
	n += 1 while polygonal_func.call(n) < 1000

	loop do
		r = polygonal_func.call(n)
		n += 1
		break if r > 9999
		next if r.to_s[2] == "0"
		results << r
	end

	return results
end

polygonals = []
tails = []

polygonals << four_digits_polygonals(&method(:triangle))
tails << polygonals[0].map{|tri| tri.to_s[2,2]}.uniq.to_set

polygonals << four_digits_polygonals(&method(:square))
tails << polygonals[1].map{|tri| tri.to_s[2,2]}.uniq.to_set

polygonals << four_digits_polygonals(&method(:pentagonal))
tails << polygonals[2].map{|tri| tri.to_s[2,2]}.uniq.to_set

polygonals << four_digits_polygonals(&method(:hexagonal))
tails << polygonals[3].map{|tri| tri.to_s[2,2]}.uniq.to_set

polygonals << four_digits_polygonals(&method(:heptagonal))
tails << polygonals[4].map{|tri| tri.to_s[2,2]}.uniq.to_set

polygonals << four_digits_polygonals(&method(:octagonal))
tails << polygonals[5].map{|tri| tri.to_s[2,2]}.uniq.to_set


[0, 1, 2, 3, 4].permutation do |arr|
	order = [5] + arr
	tmp_polygonals = Marshal.load(Marshal.dump(polygonals))
	tmp_tails = Marshal.load(Marshal.dump(tails))
	found = true
	order.each_with_index do |ord, idx|
		prev_ord = idx > 0 ? order[idx - 1] : order[5]
		tmp_polygonals[ord] = tmp_polygonals[ord].select{|p| tmp_tails[prev_ord].include?(p.to_s[0, 2])}
		tmp_tails[ord] = tmp_polygonals[ord].map{|p| p.to_s[2,2]}.uniq.to_set
		if tmp_tails[ord].empty?
			found = false
			break
		end
	end
	order.each_with_index do |ord, idx|
		prev_ord = idx > 0 ? order[idx - 1] : order[5]
		tmp_polygonals[ord] = tmp_polygonals[ord].select{|p| tmp_tails[prev_ord].include?(p.to_s[0, 2])}
		tmp_tails[ord] = tmp_polygonals[ord].map{|p| p.to_s[2,2]}.uniq.to_set
		if tmp_tails[ord].empty?
			found = false
			break
		end
	end
	order.each_with_index do |ord, idx|
		prev_ord = idx > 0 ? order[idx - 1] : order[5]
		tmp_polygonals[ord] = tmp_polygonals[ord].select{|p| tmp_tails[prev_ord].include?(p.to_s[0, 2])}
		tmp_tails[ord] = tmp_polygonals[ord].map{|p| p.to_s[2,2]}.uniq.to_set
		if tmp_tails[ord].empty?
			found = false
			break
		end
	end
	if found
		p order
		p tmp_polygonals
		p tmp_polygonals.map{|arr| arr[0]}.inject(:+)
	end
end
