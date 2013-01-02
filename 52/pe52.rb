class Integer
	def digits
		self.to_s.split("").sort
	end
end

for x in 1...1000000 do
	if [x.digits, (x * 2).digits, (x * 3).digits, (x * 4).digits, (x * 5).digits, (x * 6).digits].uniq.size == 1 then
		p x
		exit
	end
end
