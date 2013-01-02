require 'set'

$pentagonal_cache = {}
$pentagonals = Set.new
$triangle_cache = {}
$triangles = Set.new
$hexagonal_cache = {}
$hexagonals = Set.new

for n in 1..100000 do
	$pentagonal_cache[n] = n * (3 * n - 1) / 2
	$pentagonals.add($pentagonal_cache[n])
	$triangle_cache[n] = n * (n + 1) / 2
	$triangles.add($triangle_cache[n])
	$hexagonal_cache[n] = n * (2 * n - 1)
	$hexagonals.add($hexagonal_cache[n])
end

puts "Triangle, pentagonal and hexagonal cache was created."

$triangles.sort.each do |t|
	puts t if $pentagonals.include?(t) && $hexagonals.include?(t)
end
