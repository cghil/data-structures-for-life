# Create a binary search tree checker

class TreeNode
	attr_accessor :value, :left, :right

	def initialize(value)
		@value = value
		@left = nil
		@right = nil
	end
end

class Tree
	attr_accessor :root

	def initialize(root)
		@root = nil
	end

	def find_value(value)
		return find_value_node(@root, value)
	end

	def insert(val)
		@root = insert_node(@root, val)
	end

	def depth_first_print
		node = @root
		stack = [node]
		until stack.empty?
			current_node = stack.shift
			if !current_node.nil?
				puts current_node.value
				children = [current_node.left, current_node.right]
				children.each do |child|
					stack.unshift(child)
				end
			end
		end
	end

	private

	def insert_node(node, val)
		# if node is not nil keep going
		return TreeNode.new(val) unless node

		if val < node.value
			node.left = insert_node(node.left, val)
		else
			node.right = insert_node(node.right, val)
		end

		return node
	end

	def find_value_node(node, value)
		if !node || node.value == value
			return node
		end

		if (value < node.value)
			return find_value_node(node.left, value)
		end

		return find_value_node(node.right, value)
	end

end

root = TreeNode.new(8)
tree = Tree.new(root)
tree.insert(3)
tree.insert(10)
tree.insert(14)
tree.insert(13)
tree.insert(1)
tree.insert(6)
tree.insert(4)
tree.insert(7)
tree.depth_first_print




