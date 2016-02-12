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


class Explore
	def self.find_second_largest_node(root)
		parent = root
		right_child = parent.right
		if Explore.check_for_right(right_child)
			find_second_largest_node(right_child)
		else
			return parent
		end
	end

	private

	def self.check_for_right(parent)
		if parent.right
			return true
		else
			return false
		end
	end

	def self.check_for_left(parent)
		if parent.left
			return true
		else
			return false
		end
	end

end


root = BinaryTreeNode.new(10)
right = root.insert_right(100)
grandchild = right.insert_right(109)

node = Explore.find_second_largest_node(root)
puts node.value

