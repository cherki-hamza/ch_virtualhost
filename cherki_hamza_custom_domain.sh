#!/bin/bash

: '
        Developer Name : cherki hamza
        Developer website : hamzacherki.com
        Description : script for create apache virtual host + folder + domain + costum extentions (.com , .ma ; .net , ...any) created with 💚 enjoy :)
        usage : ./cherki_hamza.sh & enter the folder name example : store ==> resulte : store.com
'
echo "hello there, im cherki hamza developer web full stack https://hamzacherki.com"
echo "_______ Welcome to bash shell Script for Create Apache Virtual Host _______"

# 1) create folder website in the apache server && the index.php starter file
read -p "Enter name for folder && domain name example ==> ( google.com just write google ) : " folder
cd /var/www/html/ && sudo mkdir $folder && sudo chmod 777 $folder
cd /var/www/html/$folder  &&  touch index.php &&

# 
read -p "Enter custom extention for domain name example ==> ma or  ( com , ma , io , net ...) : " ext

echo "<center>
<h1 style='color:red'>hello from cherki hamza full stack</h1>
<h3 style='color:green'>welcome to your site: $folder.$ext</h3>
<h4>this virtual host created by software developer cherki hamza,  by bash shell script (c_h.sh) v0.1 <a target='__blink' style='color:blue' href="https://github.com/cherki-hamza/ch_virtualhost">GITHUB c_h_script Repository .</a></h4>
<h5>enjoy :)</h5>
<h6>created with 💚 by <a style='color:blue' href="https://hamzacherki.com">cherki hamza</a></h6>
</center>" > index.php


echo "Task [1] Folder $folder create with success ..."



# 2) crete new apache config file
cd /etc/apache2/sites-available  && sudo touch $folder"."$ext".conf" && sudo chmod 777 $folder"."$ext".conf" &&

echo "<VirtualHost *:80>

ServerName $folder"."$ext
DocumentRoot /var/www/html/$folder
<Directory '/var/www/html/$folder'>
    Require all granted
    AllowOverride All
</Directory>

</VirtualHost>" > $folder"."$ext".conf" 

echo "Task [2] apache setings do with success ...."

# 3) enable site in /etc/apache2/site-enabled
cd /etc/apache2/sites-available  && sudo a2ensite $folder"."$ext".conf" && sudo service apache2 reload 
cd /etc/apache2/sites-enabled && sudo chmod 777 $folder"."$ext".conf" && sudo service apache2 reload 

echo "Task [3] enable site $folder.$ext do with success ...."

# 4) 
sudo chmod 777 /etc/hosts
cd /etc &&   echo "127.0.1.1  $folder.$ext" >> hosts && sudo service apache2 reload

echo "Task [4] your site http://$folder.$ext created with success ...."
echo "enjoy :)"
