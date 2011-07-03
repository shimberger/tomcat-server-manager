#!/usr/bin/make -f

prefix=

install:
	mkdir -p $(prefix)/etc
	mkdir -p $(prefix)/var
	mkdir -p $(prefix)/usr
	cp -r etc/* $(prefix)/etc/
	cp -r var/* $(prefix)/var/
	cp -r usr/* $(prefix)/usr/
	mkdir -p $(prefix)/usr/share/man/man8/
	pandoc -s -w man README.md | gzip > $(prefix)/usr/share/man/man8/tomcat-server-manager.8.gz
