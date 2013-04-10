# Ace -> 14
# card[0] -> value, card[1] -> suit

def values(hand)
	return hand.map{|card| card[0]}
end

def suits(hand)
	return hand.map{|card| card[1]}
end

def compare_highest_value(hands)
	return values(hands[0]).sort{|a, b| b <=> a} <=> values(hands[1]).sort{|a, b| b <=> a}
end

def compare_nrange_cards(hands, nrange)
	values_of_player1 = values(hands[0])
	values_of_player2 = values(hands[1])
	pairs_value_of_player1 = values_of_player1.select{|v| nrange.include?(values_of_player1.count(v))}.uniq.sort{|a, b| b <=> a}
	pairs_value_of_player2 = values_of_player2.select{|v| nrange.include?(values_of_player2.count(v))}.uniq.sort{|a, b| b <=> a}
	return pairs_value_of_player1 <=> pairs_value_of_player2
end

def compare_n_cards(hands, n)
	return compare_nrange_cards(hands, n..n)
end

def compare_one_pair(hands)
	result = compare_n_cards(hands, 2)
	if result == 0 then
		return compare_highest_value(hands)
	else
		return result
	end
end

def compare_two_pairs(hands)
	return compare_one_pair(hands)
end

def compare_three_of_a_kind(hands)
	result = compare_n_cards(hands, 3)
	if result == 0 then
		return compare_highest_value(hands)
	else
		return result
	end
end

def compare_straight(hands)
	return compare_highest_value(hands)
end

def compare_flush(hands)
	return compare_highest_value(hands)
end

def compare_full_house(hands)
	return compare_three_of_a_kind(hands)
end

def compare_four_of_a_kind(hands)
	result = compare_n_cards(hands, 4)
	if result == 0 then
		return compare_highest_value(hands)
	else
		return result
	end
end

def compare_straight_flush(hands)
	return compare_highest_value(hands)
end

def is_one_pair(hand)
	return values(hand).uniq.size == 4
end

def is_two_pairs(hand)
	return values(hand).uniq.size == 3
end

def is_three_of_a_kind(hand)
	return is_n_of_a_kind(hand, 3)
end

def is_straight(hand)
	return values(hand).sort.each_cons(2).all?{|v1, v2| v2 - v1 == 1}
end

def is_flush(hand)
	return suits(hand).uniq.size == 1
end

def is_n_of_a_kind(hand, n)
	return values(hand).uniq.any?{|v| hand.count{|card| card[0] == v} == n}
end

def is_full_house(hand)
	return is_n_of_a_kind(hand, 3) && is_n_of_a_kind(hand, 2)
end

def is_four_of_a_kind(hand)
	return is_n_of_a_kind(hand, 4)
end

def is_straight_flush(hand)
	return is_straight(hand) && is_flush(hand)
end

def is_royal_flush(hand)
	return is_straight_flush(hand) && hand.sort[0][0] == 10
end

def compare_same_rank_hands(hands, winning_hand)
	case winning_hand
	when 10
		return compare_royal_flush(hands)
	when 9
		return compare_straight_flush(hands)
	when 8
		return compare_four_of_a_kind(hands)
	when 7
		return compare_full_house(hands)
	when 6
		return compare_flush(hands)
	when 5
		return compare_straight(hands)
	when 4
		return compare_three_of_a_kind(hands)
	when 3
		return compare_two_pairs(hands)
	when 2
		return compare_one_pair(hands)
	when 1
		return compare_highest_value(hands)
	end
end

def stringify_winning_hand(winning_hand)
	case winning_hand
	when 10
		return "royal_flush"
	when 9
		return "straight_flush"
	when 8
		return "four_of_a_kind"
	when 7
		return "full_house"
	when 6
		return "flush"
	when 5
		return "straight"
	when 4
		return "three_of_a_kind"
	when 3
		return "two_pairs"
	when 2
		return "one_pair"
	when 1
		return "high_card"
	else
		return "illegal winning hand"
	end
end

def winning_hand(hand)
	if is_royal_flush(hand) then
		return 10
	elsif is_straight_flush(hand) then
		return 9
	elsif is_four_of_a_kind(hand) then
		return 8
	elsif is_full_house(hand) then
		return 7
	elsif is_flush(hand) then
		return 6
	elsif is_straight(hand) then
		return 5
	elsif is_three_of_a_kind(hand) then
		return 4
	elsif is_two_pairs(hand) then
		return 3
	elsif is_one_pair(hand) then
		return 2
	else
		return 1
	end
end

def parse_value(value_str)
	case value_str
	when 'A'
		return 14
	when 'K'
		return 13
	when 'Q'
		return 12
	when 'J'
		return 11
	when 'T'
		return 10
	else
		return value_str.to_i
	end
end

def parse_suit(suit_str)
	case suit_str
	when 'H'
		return :heart
	when 'C'
		return :club
	when 'D'
		return :diamond
	when 'S'
		return :spade
	end
end

def parse_hand(hand_strs)
	hand_strs.map{|hand_str| [parse_value(hand_str[0, 1]), parse_suit(hand_str[1, 1])]}
end

def parse_hands_of_both_players(both_hands_str)
	hand_strs = both_hands_str.split(' ')
	return [parse_hand(hand_strs[0, 5]), parse_hand(hand_strs[5, 5])]
end

def does_player1_win(hands)
	winning_hand_of_player1 = winning_hand(hands[0])
	winning_hand_of_player2 = winning_hand(hands[1])
	puts "player1's winning hand is #{stringify_winning_hand(winning_hand_of_player1)}:#{hands[0].inspect}"
	puts "player2's winning hand is #{stringify_winning_hand(winning_hand_of_player2)}:#{hands[1].inspect}"
	if winning_hand_of_player1 > winning_hand_of_player2 then
		return true
	elsif winning_hand_of_player1 < winning_hand_of_player2 then
		return false
	elsif compare_same_rank_hands(hands, winning_hand_of_player1) > 0 then
		return true
	end
end

win_count = 0

# open("./poker.txt") do |f|
# open("./sample.txt") do |f|
while line = STDIN.gets do
	# f.each do |line|
		puts line
		hands = parse_hands_of_both_players(line)
		p hands
		if does_player1_win(hands)
			puts "player1 won."
			win_count += 1
		else
			puts "player2 won."
		end
	# end
end

puts "player1 won #{win_count} times."

