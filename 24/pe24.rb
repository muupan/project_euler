$permutations = []

def select_first(fixed, not_fixed)
	if not_fixed.empty? then
		$permutations << fixed
		if $permutations.size == 1000000 then
			p fixed
			exit
		end
	else
		not_fixed.each{|n|
			select_first(fixed + [n], not_fixed - [n])
		}
	end
end

select_first([], [0,1,2,3,4,5,6,7,8,9])

