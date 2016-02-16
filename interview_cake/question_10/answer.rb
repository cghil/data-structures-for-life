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

def find_largest_node(root)
	if (root.right)
		root = root.right
		return find_largest_node(root)
	else
		return root
	end
end

def find_second_largest(root)
	parent = root

	return nil if !parent

	if !parent.right && parent.left
		return find_largest_node(parent.left)
	end

	if parent.right && !parent.right.left && !parent.right.right
		return parent.value
	end

	return find_second_largest(parent.right)
end


root = BinaryTreeNode.new(10)
right = root.insert_right(100)
grandchild = right.insert_right(109)

