
encrypted = STDIN.gets.split(',').map{|str| str.to_i}
p encrypted.size

for a in ("a".bytes.to_a[0])..("z".bytes.to_a[0]) do
	for b in ("a".bytes.to_a[0])..("z".bytes.to_a[0]) do
		for c in ("a".bytes.to_a[0])..("z".bytes.to_a[0]) do
			decrypted = ""
			all_alphabet = true
			spaces = 0
			dots = 0
			commas = 0
			encrypted.each_with_index do |ascii, i|
				char = 0
				case i % 3
				when 0
					char = ascii ^ a
				when 1
					char = ascii ^ b
				when 2
					char = ascii ^ c
				end
				# puts "ascii:#{ascii} a:#{a} b:#{b} c:#{c} char:#{char}"
				# if char < "a".bytes.to_a[0] || char > "z".bytes.to_a[0] || char == " ".bytes.to_a[0]
				# 	all_alphabet = false
				# 	break
				# end
				spaces += 1 if char == " ".bytes.to_a[0]
				dots += 1 if char == ".".bytes.to_a[0]
				commas += 1 if char == ",".bytes.to_a[0]
				decrypted += char.chr
			end
			# if all_alphabet
			if spaces > 100 && dots > 5 && commas > 5
				p a.chr + b.chr + c.chr
				p decrypted
				p decrypted.split('').map{|str| str.bytes.to_a[0]}.inject(:+)
			end
		end
	end
end

