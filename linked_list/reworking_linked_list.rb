require 'pry'
class Node
	attr_accessor :data
	attr_accessor :next

	def initialize(data, next_node=nil)
		@data = data
		@next = next_node
	end
end

class List
	attr_accessor :head
end

# the most basic operations for linked lists are the following
# insert, find, remove

# We are going to define a routine called each to make it easier
# for other callers to iterate through the list
class List
	include Enumerable

	def each()
		item = @head
		while (item)
			yield item
			item = item.next
		end
	end
end

node = Node.new(1)
node2 = Node.new(2, node)
list = List.new()
list.head = node

binding.pry