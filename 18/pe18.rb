numbers = []

open("./input.txt") {|f|
	f.each {|line|
		numbers << line.split(" ").map {|str| str.to_i}
	}
}

(numbers.size() - 2).downto(0) {|row|
	for col in 0...(numbers[row].size()) do
		numbers[row][col] += [numbers[row+1][col], numbers[row+1][col+1]].max
	end
}

puts numbers[0][0]

