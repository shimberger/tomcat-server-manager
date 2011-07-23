% TOMCAT-SERVER-MANAGER(8) Tomcat Server Manager
% Sebastian Himberger
% July 2, 2011

Name
====

tomcat-server-manager - Manages multiple Tomcat instances

Synopsis
=======

tomcat-server-manager [*command*] [*options*]...
/etc/init.d/tomcat-servers [*command*] [*instance*]

Description
===========

Tomcat Server Manager is a package which helps you manage multiple Tomcat
instances on a single Debian/Ubuntu host. It provides the following features:

 * Providing an init-script for multiple Tomcat instances
 * Running multiple Tomcat instances under different accounts
 * A command line interface to manage instances (creation, deletion)
 * A convention on how to structure the configuration files

Usage of the management script
------------------------------

The management script (tomcat-server-manager) provides an interactive help.
The basic usage pattern is the following:

	tomcat-server-manager <command> --param1=<value> --param2=<value>

For example:

	tomcat-server-manager create-instance --instance-name=foo ...

Each command has required and optional parameters.  It will fail if a required
parameter is not specified. A full list of available commands including some
description is available via interactive help:

	tomcat-server-manager help

You can access the help for a single command in the following way:

	tomcat-server-manager help --command=create-instance

Just substitute "create-instance" for the command name you want to access
the help for.

Usage of the service wrapper
---------------------------

The service wrapper supports the usual options required for system services
(start|stop|restart|cond-restart|status). But unlike other services there
are multiple instances managed by this script. If you invoke the wrapper
in the normal way the action is performed for all instances. For example:

	/etc/init.d/tomcat-servers restart

Will restart all tomcat instances. You can specify the instance name after the
main command to only affect one instance. For example:

	/etc/init.d/tomcat-servers restart myinstance

Will only restart the instance named "myinstance".

Additionally to the standard command you can also invoke the "console" command.
This command has to be invoked with an instance. Instead of starting a background
service it will drop you right into the console of the started instance. This
can be useful for debugging purposes. Example:

	/etc/init.d/tomcat-servers console myinstance

This will start the instance "myinstance" and attach your current session to
the console.

Adding a web app to an instance
-------------------------------

The usual tomcat way is to put your applications inside the "webapps" directory
of CATALINA_HOME. The way suggested by this application is to store your applications
outside the CATALINA_HOME for example under "/srv/webapps" and add your webapps using
a context XML file. To do so create a file like the following under 
"/etc/tomcat-servers/instances/$YOURINSTANCE/contexts-available/mywebapp.xml". 
The file should have the following content:

	<Context path="/mywebapp" docBase="/srv/webapps/mywebapp" >
	</Context>

This way you can add additional configuration parameters to the webapp. After creating
the XML file create a symlink pointing to it in 
"/etc/tomcat-servers/instances/$YOURINSTANCE/contexts-enabled".

Directory Structure
===================

The relevant directories for this application are:

* /var/lib/tomcat-servers: This is where the runtime instance information (temp files, logs, ...) is stored
* /etc/tomcat-servers/: This is where the application and instance configuration is stored

Options
=======

The options are available via interactive help.

Contact
=======

You can find more about this project at GitHub:
https://github.com/shimberger/tomcat-server-manager




