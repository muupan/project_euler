require 'prime'

Prime.each(9999) do |p|
	next if p < 1000
	primes = p.to_s.split("").permutation.collect{|perm| perm.join("").to_i}.uniq.select{|i| i >= 1000 && Prime.prime?(i)}.sort
	next if primes.size < 3
	sequences = primes.combination(3).collect{|ary| ary.sort}.select{|ary| ary[1] - ary[0] == ary[2] - ary[1]}
	p sequences[0] unless sequences.empty?
	#p primes
end
