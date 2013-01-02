require 'prime'

primes = Prime.each(100000).collect{|prime| prime}

for deletion in 1...primes.size do
	primes.each_cons(primes.size - deletion) do |subseq|
		sum = subseq.inject(:+)
		break if sum >= 1000000
		if Prime.prime?(sum) then
			p sum
			p subseq
			p subseq.size
			exit
		end
	end
end

