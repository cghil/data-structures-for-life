require 'pry'
require 'set'
def binary_search(array, target)
	min = 0
	max = array.length - 1
	guess = nil
	while max >= min
		guess = (min + max)/2
		guess = guess.floor

		if array[guess] == target
			return guess
		elsif array[guess] < target
			min = guess + 1
		else
			max = guess - 1
		end
	end
	return -1
end

# this is the original answer I came up with.
# RunTime O(n * log(n))
def movie_options_equal_flight_time?(movie_lengths, flight_length)
	if movie_lengths.length < 2
		return false
	end
	movie_lengths = movie_lengths.sort

	answer = false

	movie_lengths.each do |runtime|
		
		target_time = flight_length - runtime
		found_index = binary_search(movie_lengths, target_time)
		if found_index != -1
			answer = true
		end

	end
	return answer
end

# Interview Cake answer

def get_two_movies_to_fill_flight(movie_lengths, flight_length)
	# movie lengths we've seen so far
	movie_lengths_seen = Set.new

	movie_lengths.each do |first_movie_length|
		matching_second_movie_length = flight_length - first_movie_length

		if movie_lengths_seen.include? matching_second_movie_length
			return true
		end

		movie_lengths_seen.add(first_movie_length)
	end

	# we never found a match, so return false
	return false
end