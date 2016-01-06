require 'pry'

def binary_search(array, target_value)
	min = 0;
	max = array.length - 1
	guess = nil
	while max >= min
		guess = (max + min)/2
		guess = guess.floor
		puts guess
		if array[guess] == target_value
			return guess
		elsif array[guess] < target_value
			min = guess + 1
		else
			max = guess - 1
		end
	end
	return -1
end

example = [1, 2, 5, 7, 8, 9]

puts binary_search(example, 8)