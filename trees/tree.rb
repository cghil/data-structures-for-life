
class Node
	attr_accessor :value, :children

	def initialize(value=nil)
		@value = value
		@children = []
	end

	def add_child(child) 
		self.children.push(child)
	end

end

class Tree
	attr_accessor :root

	def initialize(node)
		@root = node
	end

	def depth_first_search(value, node =self.root)
		stack = [node]
		until stack.empty?
			current_node = stack.pop
			children = current_node.children
			children.each do |child|
				stack.push(child)
			end
			if current_node.value == value
				return current_node
			else
				nil
			end
		end
	end
	# [a] a -> [b, c], b -> [d,e]
	# step 1
	# [] returns a
	# [b, c] pushes children
	# Step 2
	# [b] returns c
	# c has no children so nothing gets push on to the stack
	# [] returns b
	# b has children so [d, e] are added to the stack
	# Step 3
	# e gets poped


	def breath_first_search(value, node=self.root)
		queue = [node]
		until queue.empty?
			current_node = queue.shift
			children = current_node.children
			children.each do |child|
				queue.push(child)
			end
			if current_node.value == value
				return current_node
			end
		end
		nil
	end

	def max_branch(node=self.root)

	end
end

node_foo = Node.new(1)
node_bang = Node.new(2)
node_bar_box = Node.new(3)
node_baz_box = Node.new(4)
node_foo.add_child(node_bang)
node_foo.add_child(node_bar_box)
node_bar_box.add_child(node_baz_box)
tree = Tree.new(node_foo)
