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

##
# Unzip installer
##

node["soa_installation"]["installer_zips"].each do |zip_file|
	unzip_command = "unzip -o -d " + node["soa_installation"]["soa_tmp_dir"] + " " + zip_file
	execute unzip_command do
		action :run
		not_if do 
			FileTest.directory?(node["soa_installation"]["soa_tmp_dir"] + "/Disk4") 
		end	
	end
end
	
##
# Prepare files
##

# Response files
tmp_directory = node["soa_installation"]["middleware_home"] + "/tmp"
oracle_soa_response = tmp_directory + "/oracle_soa_response.xml"

template oracle_soa_response do
	source "oracle_soa_response.erb"
	rights :full_control, user
	variables({
		:middleware_home => node["soa_installation"]["middleware_home"],
		:oracle_soa_home => node["soa_installation"]["oracle_soa_home"]
	})
end

# Install script
run_command = node["soa_installation"]["soa_tmp_dir"] + "/Disk1/install/win64/setup.exe -jreLoc " + node["soa_installation"]["java_home"] + " -silent -response " + oracle_soa_response

##
# Run installer
##

execute run_command do
	action :run
	returns [0, 259]
	not_if do 
		FileTest.directory?(node["soa_installation"]["oracle_soa_home"]) 
	end
end

##
# Clean
##

# Delete temp directory
directory tmp_directory do
	recursive true
	rights :full_control, user
	action :delete
end