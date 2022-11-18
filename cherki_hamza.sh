#!/bin/bash

: '
        Developer Name : cherki hamza
        Developer website : hamzacherki.com
        Description : script for create apache virtual host + folder + domain 
        usage : ./cherki_hamza.sh & enter the folder name example : store ==> resulte : store.com
        must have apache2
'
echo "hello there, im cherki hamza developer web full stack https://hamzacherki.com"
echo "_______ Welcome to Create Apache Virtual Host _______"

# create folder website in the apache server && the index.php starter file
read -p "Enter name for folder: " folder;
cd /var/www/html/ && sudo mkdir $folder && cd /var/www/html/$folder && sudo touch index.php && 
echo "<center><h1 style='color:red'>hello from cherki hamza full stack</h1></center>" > index.php && 
cd /var/www/html/  && sudo chmod -R 777 $folder;
echo "Task [1] Folder $folder create with success ...";


# copy the new host from sudo cp 000-default.conf myapp.com.conf
cd /etc/apache2/sites-available  && sudo touch $folder".com.conf"  &&

echo "<VirtualHost *:80>

ServerName $folder.com
DocumentRoot /var/www/html/$folder
<Directory '/var/www/html/$folder'>
    Require all granted
    AllowOverride All
</Directory>

</VirtualHost>" > $folder".com.conf"

echo "Task [2] apache setings do with success ...."

cd /etc/apache2/sites-available  && sudo a2ensite $folder".com.conf" && sudo service apache2 reload 

echo "Task [3] do with success ...."

cd /etc && sudo  echo "127.0.1.1    $folder.com" >> hosts && sudo service apache2 reload



echo "Task [4] your site $folder.com created with success ...."

##xdg-open https://$folder.com

echo "enjoy :)"
