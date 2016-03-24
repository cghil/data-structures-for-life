def swap(items, first_i, second_i)
	placeholder = items[first_i]
	items[first_i] = items[second_i]
	items[second_i] = placeholder
end

def bubble_sort(items)
	return list if list.size <= 1 # already sorted
	swapped = true

	while swapped do
		swapped = false
		0.upto(list.size - 2) do |i|
			if list[i] > list[i+1]
				list[i], list[i+1] = list[i+1], list[i] #swap values
				swapped = true
			end
		end
	end
end