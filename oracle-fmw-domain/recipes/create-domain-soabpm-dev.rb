##
# Create directories
##
user = node["fmw_domain"]["user"]
tmp_directory = node["fmw_domain"]["middleware_home"] + "/tmp"

directory tmp_directory do
	rights :full_control, user
	action :create
end

##
# Prepare files
##
create_domain_soabpm_dev = tmp_directory + '/create_domain_soabpm_dev.py'

# Response files
template create_domain_soabpm_dev do
	source "create_domain_soabpm_dev.erb"
	rights :full_control, user
	variables({
		:weblogic_home => node["fmw_domain"]["weblogic_home"],
		:oracle_soa_home => node["fmw_domain"]["oracle_soa_home"],
		:oracle_common_home => node["fmw_domain"]["oracle_common_home"],
		:domain_name => node["fmw_domain"]["domain_name"],
		:domain_directory => node["fmw_domain"]["domain_directory"],
		:app_directory => node["fmw_domain"]["app_directory"],
		:bpm_server_name => node["fmw_domain"]["bpm_server_name"],
		:java_home => node["fmw_domain"]["java_home"],
		:db_host => node["fmw_domain"]["db_host"],
		:db_port => node["fmw_domain"]["db_port"],
		:db_service => node["fmw_domain"]["db_service"],
		:db_schema_prefix => node["fmw_domain"]["db_schema_prefix"],
		:bam_enabled => node["fmw_domain"]["bam_enabled"],
		:bpm_server_port => node["fmw_domain"]["bpm_server_port"]
	})
end

##
# Run script
##
wlst_exec = node["fmw_domain"]["weblogic_home"] + "/common/bin/wlst"
wlst_command = wlst_exec + " " + create_domain_soabpm_dev

execute wlst_command do
	action :run
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