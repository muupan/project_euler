require 'prime'

diagonals = [1]
diagonal_primes = []

tmp = 1
for n in 1..100000 do
	tmp += 2 * n
	diagonals << tmp
	diagonal_primes << tmp if Prime.prime?(tmp)
	tmp += 2 * n
	diagonals << tmp
	diagonal_primes << tmp if Prime.prime?(tmp)
	tmp += 2 * n
	diagonals << tmp
	diagonal_primes << tmp if Prime.prime?(tmp)
	tmp += 2 * n
	diagonals << tmp
	diagonal_primes << tmp if Prime.prime?(tmp)
	if diagonals.size.to_f / diagonal_primes.size.to_f > 10.0
		p diagonals
		p diagonal_primes
		p 2 * n + 1
		break
	end
end



