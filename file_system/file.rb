require 'pry'
class Directory
	attr_accessor :name, :children

	def initialize(name)
		@name = name
		@children = []
	end

	def add(name)
		dir = Directory.new(name)
		@children.push(dir)
		return dir
	end

	def cd(path)

		current_dir = self
		folders_within_path = path.split('/')
		length_of_path = folders_within_path.length
		searched_for_dir= folders_within_path.last
		queue = [current_dir]
		counter = 1
		found_dir = nil

		until queue.empty?
			parent_dir = queue.shift
			children_dirs = parent_dir.children


			target_name = folders_within_path.shift

			children_dirs.each do |child_dir|
				if searched_for_dir == child_dir.name
					if counter == length_of_path
						found_dir = child_dir
					end
				end

				if found_dir == nil
					if target_name == child_dir.name
						counter+=1
						queue.push(child_dir)
					end
				end
			end
		end

		return found_dir
	end
end

root_dir = Directory.new('documents')
root_dir.add('empty_folder')
book_report = root_dir.add('book_report')
drafts = book_report.add('drafts')
drafts.add('final')
# /documents
#    /empty_folder
#    /bookreport
#        /drafts
#        	  /final
p root_dir.cd('book_report/drafts/final')