require 'prime'

for n in 2...1000000 do
	n_division = Prime.prime_division(n)
	next if n_division.size != 4
	n1_division = Prime.prime_division(n+1)
	next if n1_division.size != 4
	n2_division = Prime.prime_division(n+2)
	next if n2_division.size != 4
	n3_division = Prime.prime_division(n+3)
	next if n3_division.size != 4
	if (n_division & n1_division & n2_division & n3_division).empty?
		p n
		p n_division
		p n1_division
		p n2_division
		p n3_division
		exit
	end
end
