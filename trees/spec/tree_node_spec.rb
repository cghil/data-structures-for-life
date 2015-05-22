require_relative '../tree'

describe Tree do
	let(:value) { 1 }
	let(:other_value) { 2 }
	let(:node) { Node.new(value)}
	let(:other_node) {Node.new(other_value)}

	describe "#new(value)" do
		it "creates a new Node object for Trees" do
			expect(node).to be_a Node
		end

		it "sets the node's value to the passed value" do
			expect(node.value).to eq value
		end
	end

	describe "#value" do
		it "returns the value of the node" do
			expect(node.value).to eq value
		end
	end

	describe "#add_child(child)" do
		it "adds a child to the children of the node" do
			expect {
				node.add_child(other_node)
			}.to change { node.children.size }.by 1
		end
	end

	describe "#children" do
		it "returns a collection of child nodes" do
			node.add_child(other_node)
			children = node.children
			children.each do |child|
				expect(child).to be_a Node
			end
		end
	end
end