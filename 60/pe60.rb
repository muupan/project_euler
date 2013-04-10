require 'prime'
require 'set'

prime_pairs_for_each_prime = {}

def is_prime_pair(p, q)
	return Prime.prime?((p.to_s + q.to_s).to_i) && Prime.prime?((q.to_s + p.to_s).to_i)
end

def is_prime_trio(p, q, r)
	return is_prime_pair(p, q) && is_prime_pair(q, r) && is_prime_pair(r, p)
end

def extract_prime_trios(ps)
	trios = []
	return trios if ps.size < 3
	ps.combination(3) do |p, q, r|
		trios << [p, q, r] if is_prime_trio(p, q, r)
	end
	return trios
end

primes = Prime.each(10000).to_a
primes.combination(2) do |p, q|
	if is_prime_pair(p, q)
		prime_pairs_for_each_prime[p] = Set.new if !prime_pairs_for_each_prime.key?(p)
		prime_pairs_for_each_prime[q] = Set.new if !prime_pairs_for_each_prime.key?(q)
		prime_pairs_for_each_prime[p] << q
		prime_pairs_for_each_prime[q] << p
	end
end

prime_pairs_for_each_prime.each do |p, pairs|
	pairs.each do |q|
		common = pairs & prime_pairs_for_each_prime[q]
		trios = extract_prime_trios(common.to_a)
		if !trios.empty?
			puts "p:#{p} q:#{q} trios:#{trios}"
		end
	end
end

# p prime_pairs_for_each_prime

