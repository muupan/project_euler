$score_of_a = "A".bytes.to_a[0]

def calc_score_of_char(char)
	char.bytes.to_a[0] - $score_of_a + 1
end

def calc_score(name, index)
	return (index + 1) * name.split(//).inject(0){|sum, c| sum + calc_score_of_char(c)}
end

f = open("./names.txt")
str = f.read
names = str.slice(1, str.size - 2).split('","')
sum = 0
names.sort.each_with_index{|name, i|
	sum += calc_score(name, i)
}
puts sum


