require 'pry'

def counting_sort(the_array, max_value)

  # array of 0s at indices 0..max_value
  nums_to_counts = [0] * (max_value+1)

  # populate nums_to_counts
  the_array.each do |item|
    nums_to_counts[item] += 1
  end

  print nums_to_counts
  puts ""

  # populate the final sorted array
  sorted_array = []

  # for each item in nums_to_counts
  nums_to_counts.each_with_index do |count, item|
    #item is the index
    #count is the num
    # for the number of times the item occurs
    (0...count).each do |time|
      # add it to the sorted array
      puts item
     sorted_array.push(item)
    end
  end

  return sorted_array
end

array = [5, 10, 3, 2, 8, 9]
sorted_array = counting_sort(array, 10)
print sorted_array
puts ""