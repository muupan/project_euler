#http://tsumuji.cocolog-nifty.com/tsumuji/2009/06/project-eule-10.html

class Integer
	def factorize
		return [] if self < 2
		ans = Array.new
		n = self
		[2, 3].each do |i|
			c = 0
			while n % i == 0
				c = c + 1
				n = n / i
			end
			ans << [i, c] if c > 0
		end
		i = 5
		add = 2
		while true
			c = 0
			while n % i == 0
				c = c + 1
				n = n / i
			end
			ans << [i, c] if c > 0
			i = i + add
			break if n < i * i
			add = 6 - add
		end
		ans << [n, 1] if n > 1
		return ans
	end
end

tri = 0
dic = {}

def tri(n)
	n * (n + 1) / 2
end

def fac_num(n, dic)
	if dic.key?(n)
		dic[n]
	else
		dic[n] = n.factorize.inject(1) { |pr, n| pr * (n[1] + 1) }
	end
end

1.upto(1.0/0) do |i|
	t = tri(i)
	if i % 2 == 0
		dic[t] = fac_num(i / 2, dic) * fac_num(i + 1, dic)
	else
		dic[t] = fac_num(i, dic) * fac_num((i + 1) / 2, dic)
	end
	if dic[t] > 500
		puts t
		break
	end
end
	
