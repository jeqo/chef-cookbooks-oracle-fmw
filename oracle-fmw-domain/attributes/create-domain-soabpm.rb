# Oracle Homes
default["fmw_domain"]["middleware_home"] = "C:/u01/oracle/fmw/soabpm/11.1.1.7"
default["fmw_domain"]["oracle_common_home"] = "C:/u01/oracle/fmw/soabpm/11.1.1.7/oracle_common"
default["fmw_domain"]["oracle_soa_home"] = "C:/u01/oracle/fmw/soabpm/11.1.1.7/oracle_soa"
default["fmw_domain"]["weblogic_home"] = "C:/u01/oracle/fmw/soabpm/11.1.1.7/wlserver_10.3"
default["fmw_domain"]["java_home"] = "C:/oracle/java/jdk1.7.0_51"

# BPM server
default["fmw_domain"]["bpm_server_name"] = "bpm_server01"
default["fmw_domain"]["bpm_server_port"] = 7001

# Domain info
default["fmw_domain"]["domain_name"] = "dev_soabpm_domain"
default["fmw_domain"]["domain_directory"] = "C:/u01/oracle/work/soabpm/11.1.1.7/domains"
default["fmw_domain"]["app_directory"] = "C:/u01/oracle/work/soabpm/11.1.1.7/apps"

# Metadata schemas
default["fmw_domain"]["db_host"] = "localhost"
default["fmw_domain"]["db_port"] = 1521
default["fmw_domain"]["db_service"] = "xe"
default["fmw_domain"]["db_schema_prefix"] = "DEVBPM"

# BAM?
default["fmw_domain"]["bam_enabled"] = true

# User
default["fmw_domain"]["user"] = "JEQO"