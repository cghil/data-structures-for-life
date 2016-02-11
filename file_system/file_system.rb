class Directory
	attr_accessor :name, :children
	def initialize(name)
		@name = name
		@children = []
	end
	def add(file)
		self.children.push(file)
	end
	def cd(path)
		path = path # 'foo/bar/baz'
		path_array = path.split('/') # [foo, bar, baz]
		last_folder = path_array.last 
    root_dir = path_array.shift() # foo
    path = path_array.join('/')
    found_dir = nil
    children_directories = self.children
    children_directories.each do |dir|
    	if dir.name == root_dir
    		found_dir = dir
    	end
    end
    if path_array.length == 0
    	return found_dir
    else
    	found_dir.cd(path)
    end
	end
end

root_dir = Directory.new("documents")
root_dir.add(Directory.new('empty_folder'))
book_report = Directory.new('bookreport')
root_dir.add(book_report)
drafts = Directory.new('drafts')
book_report.add(drafts)
drafts.add(Directory.new('final'))
# /documents
#    /empty_folder
#    /bookreport
#        /drafts
#        	  /final_drafts

object = root_dir.cd('bookreport/drafts/final') #[bookreport, drafts, final]
p object
