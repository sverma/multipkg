install:
	cp src/multipkg /usr/local/bin
	chmod +x /usr/local/bin/multipkg
	echo " Creating Directory : /etc/multipkg"
	mkdir -p /etc/multipkg/
	cp spec_template.erb /etc/multipkg/spec_template.erb
