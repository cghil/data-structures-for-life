require 'pry'

# Given an array_of_ints, find the highest_product you can get from three of the integers.

def highest_product(list)
	list = list.sort
	
	max1 = list[-1]
	max2 = list[-2]
	max3 = list[-3]
	min1 = list[0]
	min2 = list[1]

	min_product = min1 * min2 * max1
	max_product = max1 * max2 * max3
	if (min_product > max_product)
		max_product = min_product
	end

	return max_product
end

binding.pry