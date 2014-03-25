test_file = node.default["soa_installation"]["directory"] + "test.txt"

node.default["soa_installation"]["directories"].each do |soa_directory|
	directory soa_directory do
		rights :full_control, "JEQO"
		action :create
	end
end		

file test_file do
	rights :full_control, "JEQO"
	action :create
end