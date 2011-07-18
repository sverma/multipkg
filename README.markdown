# Multipkg Script
* Custom script to convert a directory structure in a rpm .
* noarch rpm generation , Right now it deals good with flat files , like .war , custom scripts , config files packaging , php files anything whatever so ever which doesn't require build/make stuff .

## Installation
* If you have a linux server then installing it just one step.
* Clone the multipkg repository

### STEPS 
1. `git clone git@github.com:sverma/multipkg.git`
2. `cd multipkg`
3. `make install`

#### It will install two files in your server .
* /usr/local/bin/multipkg ( Ruby Script )
* /etc/multipkg/spec_template.erb ( Ruby template for spec file )

## Usage
* First plan your directory structure where you want your files to go on the server .
* Let suppose you have following 4 files which should be packaged in rpm and installed on the server with the below directory structure.

1. ` /etc/myapplication/default.conf `
2. ` /var/www/html/myapplication/myapplication.php `
3. ` /var/www/html/myapplication/myapplicationLogic.php `
4.  ` /etc/init.d/myapplication `


1. To create a RPM with the above files , create a directory with your application name "myapplication" and "myapplication/root" . 
* ` myapplication/ `
* ` myapplication/root ( Will ACT as FAKE ROOT DIRECTORY ) `
2. Create a version file myapplication/version Containing the version , release , architecture information
### myapplication/version

`name: myapplication`
`version : 0.1`
`release: 1`
`arch: noarch`

3. Execute the command
`sudo multipkg --dir myapplication`
4. This is create myapplication.\<version\>.\<release\>.noarch.rpm in following folder 
`myapplication/packages`
### Optional 
* Adding installation scripts
* If you have any post/pre installation/uninstallation commands you can add them in version file with the following tags
* pre , post , preun , postun
### Things to do
* Adding source rpm support
* Adding build/make support
