require 'pry'
non_sorted_array = [9, 8, 6, 1, 2, 5, 4, 3, 9, 50, 12, 11] #value of the last number's index

def fuck_it(array)
	p array
	n = array.size - 1
	n.times do |i|
	  index_min = i
	 
	  (i + 1).upto(n) do |j|
	    index_min = j if array[j] < array[index_min]
	  end
	  
	  # Yep, in ruby I can do that, no aux variable. w00t!
	  array[i], array[index_min] = array[index_min], array[i] if index_min != i
	end
	array
end

# p selection_sort(non_sorted_array)
p fuck_it(non_sorted_array)