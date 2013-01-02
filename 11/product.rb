numbers = []
while line = STDIN.gets
	break if /exit/ =~ line
	row = line.split(" ").map {|str| str.to_i}
	numbers << row
end

col_num = numbers.length
row_num = numbers[0].length
max = 0

for col in 0...col_num
	for row in 0...row_num
	
		if col < col_num - 3 and row < row_num - 3
			max = [max, numbers[col][row] * numbers[col + 1][row + 1] * numbers[col + 2][row + 2] * numbers[col + 3][row + 3]].max
		end
		
		if col >= 3 and row < row_num - 3
			max = [max, numbers[col][row] * numbers[col - 1][row + 1] * numbers[col - 2][row + 2] * numbers[col - 3][row + 3]].max
		end
		
		if col < col_num - 3
			max = [max, numbers[col][row] * numbers[col + 1][row] * numbers[col + 2][row] * numbers[col + 3][row]].max
		end
		
		if row < row_num - 3
			max = [max, numbers[col][row] * numbers[col][row + 1] * numbers[col][row + 2] * numbers[col][row + 3]].max
		end
	end
end

puts "max is #{max}"