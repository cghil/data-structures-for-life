require 'pry'

class Stack
	attr_accessor :container
	def initialize
		@container = []
	end
	def peek
		@container[-1] #looks at the last one
	end
	def pop
		@container.delete_at(-1) #gives you the last element of a node
	end
	def push(value)
		@container.push(value) #pushes at the end of the array
	end

	def is_empty?
		peek == nil
	end

end

module Mixin
	def [](position)
		current_node = @head
		counter = 0
		until counter == position
			current_node = current_node.next
			counter +=1
		end
		current_node
	end

	def length
		current_node = @head
		counter = 0
		until current_node == nil
			current_node = current_node.next
			counter +=1
		end
		return counter
	end

	def insert(node, position)
		if position == 0
			former_head = self.head
			self.head = node
			node.next = former_head
		else
		  before_node = self.[](position)
		  after_node = before_node.next
		  before_node.next = node
		  node.next = after_node
		  node
		end
	end

	def print_backwards
		stack_that_linked_list = Stack.new
		head = self.head
		stack_that_linked_list.push(head)
		next_node = head.next
		until next_node == nil
			stack_that_linked_list.push(next_node)
			next_node = next_node.next
		end
		until stack_that_linked_list.is_empty?
			stack_item = stack_that_linked_list.pop
			puts stack_item.value
		end
	end

	def remove(index)
		if index == 0
			former_head = self.head
			self.head = former_head.next
			former_head
		else
			before_node = self.[](index-1)
			node_to_delete = self.[](index)
			after_node = node_to_delete.next
			before_node.next = after_node
			node_to_delete.next = nil
			node_to_delete
		end
	end

	def print_all_values
		head = self.head
		puts head.value
		next_node = head.next
		until next_node == nil
			puts next_node.value
			next_node = next_node.next
		end
	end
end

class Node
	attr_accessor :next, :value

	def initialize(value = nil, next_node=nil)
		@value = value
		@next = next_node
	end

end



class LinkedList
	attr_accessor :head

	def initialize(head =Node.new)
		@head = head
	end

	def add_node_to_end(node = Node.new)
		next_node = @head.next
		if next_node == nil
			@head.next = node
		else
			until next_node.next = nil
				next_node = next_node.next
			end
			next_node.next = node
		end
	end
	include Mixin
end




#Tests
## Node can have a value

node = Node.new(1)
node_two = Node.new(2, node)
node_three = Node.new(3, node_two)

ll = LinkedList.new(node_three)
new_node = Node.new(4)
# ll.insert(new_node, 2)
binding.pry