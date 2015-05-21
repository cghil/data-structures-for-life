class Node
	attr_accessor :value, :children

	def initialize(value=nil, children=[])
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

	def search(node=@root, &block)
		children = node.children
		children.size.times do |i|
			child = children[i]
			return child if block.call(child.value) == true
			returned = search(child, &block)
			return returned if returned
		end
		nil
	end
end

node_foo = Node.new("<body id='foo'>")
node_bang = Node.new("<h1 id='bang'>")
node_bar_box = Node.new("<div id='bar-box'>")
node_baz_box = Node.new("<div id='baz-box'>")
tree = Tree.new(node_foo)