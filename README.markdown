# Multipkg Script
* Custom script to convert a directory structure in a rpm .
* noarch rpm generation , Right now it deals good with flat files , like .war , custom scripts , config files packaging , php files anything whatever so ever which doesn't require build/make stuff .

## Installation
* If you have a linux server then installing it just one step.
* Clone the multipkg repository
1 `git clone git@github.com:sverma/multipkg.git`
2 `cd multipkg`
3 `make install`
* It will install two files in your server .
* /usr/local/bin/multipkg ( Ruby Script )
* /etc/multipkg/spec_template.erb ( Ruby template for spec file )

# Usage
## First plan your directory structure where you want your files to go on the server .
## Let suppose you have three files which should be packaged in rpm and installed on the server with the below directory structure.
* /etc/xyz/xyz.conf
* /home/xyz/pull
* /var/www/html/xyz/file_hash

1.) Above is your directory structure planning , Now to actually make a RPM of your above 3 files : xyz.conf , pull , file_hash . Get your build machine , intalled the multipkg rpm and make a directory structure as below , lets say as example your package name is test_package

<package name>/
<package name>/root ( Will ACT as FAKE ROOT DIRECTORY )
<package name>/packages

2.) Create a version file <package name>/version Containing the version , release , architecture information

version : <version number>
release: <release name>
arch: < architecture name | noarch or i386 or i686 >

3.) Execute the command

sudo multipkg --dir <package name>

4.) Get the RPM in

<package name>/packages

# mkdir -p metapackages
# cd metapackages 
# mkdir test_package
# mkdir test_package/{root} 
# cat - > test_package/version
version: 1
release: 1 
arch: noarch
# mkdir -p  test_package/root/etc/xyz/
# mkdir -p test_package/root//home/xyz
# mkdir -p test_package/root/var/www/html/xyz
# touch test_package/root/etc/xyz/xyz.conf test_package/root/var/www/html/xyz/file_hash test_package/root/home/xyz/pull 
# multipkg --dir test_package --quiet 
etc/
etc/xyz/
etc/xyz/xyz.conf
home/
home/xyz/
home/xyz/pull
var/
var/www/
var/www/html/
var/www/html/xyz/
var/www/html/xyz/file_hash


 debug test_package//root /home/saurabh.ve/metapackages/test_package/  

 
%attr(0644,saurabh.ve,t-sysad)  /home/xyz/pull
%attr(0644,saurabh.ve,t-sysad)  /etc/xyz/xyz.conf
%attr(0644,saurabh.ve,t-sysad)  /var/www/html/xyz/file_hash

 Copying /tmp/rpm/RPMS/noarch/test_package-1-1.noarch.rpm  to test_package/packages/ 

# rpm -qpl test_package/packages/test_package-1-1.noarch.rpm 
/etc/xyz/xyz.conf
/home/xyz/pull
/var/www/html/xyz/file_hash

Adding installation scripts

    * If you have any post/pre installation/uninstallation commands you can add them in version file with the following tags
          o pre , post , preun , postun

Things to do

    * Adding source rpm support
    * Adding build/make support

# test readme
