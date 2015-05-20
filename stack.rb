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