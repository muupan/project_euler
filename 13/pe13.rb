sum = 0
open("./input.txt") {|f|
	f.each {|line|
		sum += line.to_i
	}
}
puts sum

