
def find_five_permutations(cubes)
	permutation_map = {}
	smallest_cube = {}
	cubes.each do |cube|
		sorted = cube.to_s.split(//).sort
		permutation_map[sorted] = [] if !permutation_map.key?(sorted)
		permutation_map[sorted] << cube
	end
	answers = permutation_map.select{|k, v| v.size == 5}
	if !answers.empty?
		p answers
		exit
	end
end

cubes = []
n = 346
loop do
	cube = n ** 3
	if cube.to_s.size > cubes.last.to_s.size
		puts "find from cubes:"
		p cubes
		find_five_permutations(cubes)
		cubes = []
	end
	cubes << cube
	n += 1
end
