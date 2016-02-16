require 'pry'
class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end

end

class LinkedList
	attr_accessor :head

	def initialize(head)
		@head = head
	end

	def get_node_at(position)
		current_node = @head
		counter = 0
		until counter == position
			current_node = current_node.next
			counter +=1
		end
		return current_node
	end

	def insert_at(position, node)
		if position == 0
			former_head = self.head
			self.head = node
			node.next = former_head
			return node
		else
			lead_node = get_node_at(position-1)
			previous_child_node = lead_node.next
			lead_node.next = node
			node.next = previous_child_node
			return node
		end
	end

	def remove_at(index)
		if index == 0
			former_head = self.head
			self.head = former_head.next
			return former_head
		else
			parent_node = get_node_at(index-1)
			delete_node = get_node_at(index)
			parent_node.next = delete_node.next
			delete_node.next = nil
			return delete_node
		end
	end

	def reverse_list
		stack = [];
		current_node = self.head;
		until current_node == nil
			stack << current_node
			current_node = current_node.next
		end
		lead_node = stack.pop()
		until stack.empty?
			child_node = stack.pop()
			if lead_node.next == nil
				self.head = lead_node
			end
			lead_node.next = child_node
			puts lead_node.value
			lead_node = child_node
		end
		lead_node.next = nil
		return self.head
	end

	#create a stack
	# insert each node into the stack.
	# the last node becomes the head
	# (node + 1).next = node
end

a = LinkedListNode.new('A')
b = LinkedListNode.new('B')
c = LinkedListNode.new('C')

a.next = b
b.next = c

linkedlist = LinkedList.new(a)
linkedlist.reverse_list
binding.pry