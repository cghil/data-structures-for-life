#how to run rspec
# 1. make sure to have a Gemfile to hold the gem rspec
#note: this can be done with a bundle init then write gem rspec within the file
# 2. run bundle install to make sure that gems are loaded for the running of the rspec file
# 3. make sure you are in the spec folder to run a specific rspec file ... ex. rspec tree_spec.rb


require_relative '../tree'

describe Tree do
	let(:node) {Node.new(1)}
	let(:tree) {Tree.new(node)}

	describe "#new" do
		it "creates a new Tree object" do
			expect(tree).to be_a Tree
		end

		it "sets the passed node as the root" do
			expect(tree.root).to eq node
		end
	end

	describe "search for #depth_first_search and #breath_first_search" do
		before do
			root = Node.new(1)
			node2 = Node.new(2) 
			node3 = Node.new(3)
			@node4 = Node.new(4)
			root.add_child(node2)
			root.add_child(node3)
			node3.add_child(@node4)
			@tree = Tree.new(root)
		end

		it "returns the first node for DFS when value is in the tree" do
			returned= @tree.depth_first_search(4)
			expect(returned).to eq @node4
		end

		it "returns the first node for BFS when value is in the tree" do
			returned = @tree.breath_first_search(4)
			expect(returned).to eq @node4
		end

		it "returns nil if there is no node with the searched for value #DFS" do
			returned = @tree.depth_first_search(99)
			expect(returned).to eq nil
		end

		it "returns nil if there is no node with the searched for value #BFS" do
			returned = @tree.breath_first_search(89)
			expect(returned).to eq nil
		end
	end
end