##
# Create directories
##

# Set user variable
user = node["soa_installation"]["user"]

# Middleware Home directories
node["soa_installation"]["directories"].each do |soa_directory|
	directory soa_directory do
		rights :full_control, user
		action :create
	end
end


