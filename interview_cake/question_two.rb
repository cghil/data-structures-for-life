require 'pry'

# You have an array of integers and for each index you want to find the product of every integer except the integer at that index

# First Answer with division
# runtime O(n)
def get_products_of_all_ints_except_at_index_with_division(list)
	products_of_all_ints_except_at_index = []

	# find the total product of all integers
	total_product = 1
	
	list.each do |num|
		total_product *= num
	end

	list.each do |num|
		product_without_current_index = total_product/num
		products_of_all_ints_except_at_index << product_without_current_index
	end

	return products_of_all_ints_except_at_index
end

# Answer without division OG
# runtime O(n^2)
def get_products_of_all_ints_except_at_index_og(list)

	products_of_all_ints_except_at_index = []

	list.each_with_index do |num, index|
		product_without_current_index = 1
		list.each_with_index do |nested_num, nested_index|
			if index != nested_index
				product_without_current_index *= nested_num
			end
		end
		products_of_all_ints_except_at_index << product_without_current_index
	end

	return products_of_all_ints_except_at_index
end

#Answer without division best Answer

def get_products_of_all_ints_except_at_index_best_answer(list)
	product_of_all_ints_before_index = []
	product_of_all_ints_after_index = []

	product_so_far = 1
	for i in (0...list.length)
		product_of_all_ints_before_index[i] = product_so_far
		product_so_far*= list[i]
	end

	product_so_far = 1
	i = list.length - 1
	while i >= 0
		product_of_all_ints_after_index[i] = product_so_far
		product_so_far*=list[i]
		i -=1
	end

	products = product_of_all_ints_before_index
	products.each_with_index do |product, index|
		products[index] = product * product_of_all_ints_after_index[index]
	end

	return products

end