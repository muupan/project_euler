$score_of_a = "A".bytes.to_a[0]

def calc_score_of_char(char)
	char.bytes.to_a[0] - $score_of_a + 1
end

def calc_score(word)
	return word.split("").inject(0){|sum, c| sum + calc_score_of_char(c)}
end

def is_triangle_number(n)
	for i in 1...999 do
		return true if i * (i + 1) / 2 == n
		return false if i * (i + 1) / 2 > n
	end
end

f = open("./words.txt")
str = f.read
words = str.slice(1, str.size - 2).split('","')

p words.count{|word| is_triangle_number(calc_score(word))}

