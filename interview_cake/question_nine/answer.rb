class BinaryTreeNode
	attr_accessor :value
	attr_reader :left, :right

	def initialize(value)
		@value = value
		@left = nil
		@right = nil
	end

	def insert_left(value)
		@left = BinaryTreeNode.new(value)
		return @left
	end

	def insert_right(value)
		@right = BinaryTreeNode.new(value)
		return @right
	end
end

# children go on stack
# compare parent with children
# 1. left children must be less than parent
# 2. right children must be greater than parent
# if false return false

def isBinarySearchTree?(root)
	answer = true
	node = root
	stack = [ node ]
	until stack.empty?
		right_child = nil
		left_child = nil

		parent = stack.pop()

		if !parent.right.nil?
			right_child = parent.right
			stack.unshift(right_child)
		end
		if !parent.left.nil?
			left_child = parent.left
			stack.unshift(left_child)
		end

		if right_child and right_child.value <= parent.value
			answer = false
			break
		end
		if left_child and left_child.value >= parent.value
			# puts "hello"
			answer = false
			break
		end
	end
	return answer
end

root = BinaryTreeNode.new(10)
right = root.insert_right(25)
right_grandchild_left = right.insert_left(20)
right_grandchild_right = right.insert_right(30)

right_grandchild_left.insert_left(31)

puts "====================="
puts isBinarySearchTree?(root)