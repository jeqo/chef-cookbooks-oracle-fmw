##
# Create directories
##

# Set user variable
user = node["wls_installation"]["user"]

# Middleware Home directories
node["wls_installation"]["directories"].each do |wls_directory|
	directory wls_directory do
		rights :full_control, user
		action :create
	end
end

##
# Prepare files
##

# Response files
tmp_directory = node["wls_installation"]["middleware_home"] + "/tmp"
weblogic_response = tmp_directory + "/weblogic_response.xml"

template weblogic_response do
	source "weblogic_response.erb"
	rights :full_control, user
	variables({
		:middleware_home => node["wls_installation"]["middleware_home"],
		:weblogic_home => node["wls_installation"]["weblogic_home"],
		:java_home => node["wls_installation"]["java_home"]
	})
end

# Install script
log_file =  tmp_directory + "/install.log"
java_exe = node["wls_installation"]["java_home"] + "/bin/java"
run_command = java_exe + " -jar " + node["wls_installation"]["installer"] 
install_script = tmp_directory + "/install_script.cmd"

template install_script do
	source "install_script.erb"
	rights :full_control, user
	variables({
		:wls_install_command => run_command,
		:response_file => weblogic_response,
		:log_file => log_file
	})
end


##
# Run installer
##

execute install_script do
	action :run
	not_if do 
		FileTest.directory?(node["wls_installation"]["weblogic_home"]) 
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