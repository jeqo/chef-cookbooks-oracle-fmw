# User who installs the software
default["wls_installation"]["user"] = "JEQO"

# Where weblogic would be installed
default["wls_installation"]["directories"] = [
	"C:/u01",
	"C:/u01/oracle",
	"C:/u01/oracle/fmw",
	"C:/u01/oracle/fmw/soabpm",
	"C:/u01/oracle/fmw/soabpm/11.1.1.7",
	"C:/u01/oracle/fmw/soabpm/11.1.1.7/tmp"
]

# Oracle Homes
default["wls_installation"]["middleware_home"] = "C:/u01/oracle/fmw/soabpm/11.1.1.7"
default["wls_installation"]["weblogic_home"] = node["wls_installation"]["middleware_home"] + "/wlserver_10.3"
default["wls_installation"]["java_home"] = "C:/oracle/java/jdk1.7.0_51"

# WebLogic installer http://download.oracle.com/otn/nt/middleware/11g/wls/1036/wls1036_generic.jar
default["wls_installation"]["installer"] = "C:/oracle/fmw/installers/wls/wls1036_generic.jar"