require 'pry'

def print_spiral(array, num_of_rows, num_of_cols)
	if !array.kind_of?(Array)
		return print "Error not array"
	end

	top = 0
	bottom = num_of_rows - 1
	left = 0
	right = num_of_cols - 1
	direction = 0

	# direction can be the following { 0: right, 1: down, 2: left, 3: up }
	# direction represents the way we are tracing the array
	while(top <= bottom && left<=right)
		if direction == 0
			(left..right).each do |e|
				puts array[top][e]
			end
			top+=1
			direction = 1

		elsif direction == 1
			(top..bottom).each do |e|
				puts array[e][right]
			end
			right -=1
			direction = 2
		elsif direction == 2
			right.downto(left) do |e|
				puts array[bottom][e]	
			end
			bottom-=1
			direction =3

		elsif direction == 3
			bottom.downto(top) do |e|
				puts array[e][left]
			end
			left+=1
			direction = 0
		end
	end

end

example = [
			[0, 1, 2, 3], 
			[4, 5, 6, 7],
			[8, 9, 10, 11],
			[12, 13, 14, 15]
		]

print_spiral(example, 4, 4)