# one two three four five six seven eight nine ten
# eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
# twenty thirty forty fifty sixty seventy eighty ninety
# thousand
$letters = {1=>3, 2=>3, 3=>5, 4=>4, 5=>4, 6=>3, 7=>5, 8=>5, 9=>4, 10=>3,
	11=>6, 12=>6, 13=>8, 14=>8, 15=>7, 16=>7, 17=>9, 18=>8, 19=>8,
	20=>6, 30=>6, 40=>5, 50=>5, 60=>5, 70=>7, 80=>6, 90=>6,
	100=>10, 200=>10, 300=>12, 400=>11, 500=>11, 600=>10, 700=>12, 800=>12, 900=>11, 1000=>11}

def calc_letters(n)
	if $letters.key? n then
		return $letters[n]
	else
		if n > 100 then
			return calc_letters(n - n % 100) + 3 + calc_letters(n % 100)
		else
			return calc_letters(n - n % 10) + calc_letters(n % 10)
		end
	end
end

sum = 0
for i in 1..1000 do
	l = calc_letters(i)
	sum += l
	puts "#{i}:#{l}"
end
puts "sum:#{sum}"
