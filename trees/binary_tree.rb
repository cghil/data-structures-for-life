class TreeNode
	attr_accessor :data
	attr_accessor :left
	attr_accessor :right

	def initialize(data)
		@data = data
		@left = nil
		@right = nil
	end
end

class Tree
	attr_accessor :root

	def initialize()
		@root = nil
	end
end

class Tree
	def insert(val)
		@root = insert_node(@root, val)
	end
	
	private

	def insert_node(node, val)
		return TreeNode.new(val) unless node
		
