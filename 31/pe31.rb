require 'set'

$selections = [] 

def select_coins(rest, selection, remaining_coins)
	if rest == 0 then
		$selections << selection
		p selection
	elsif not remaining_coins.empty?
		coin = remaining_coins.first
		for amount in 0..(rest / coin) do
			new_selection = selection.clone
			new_selection[coin] = amount if amount > 0
			select_coins(rest - coin * amount, new_selection, remaining_coins - [coin])
		end
	end
end

select_coins(200, {}, [1, 2, 5, 10, 20, 50, 100, 200].reverse)

puts "num:#{$selections.size}"

