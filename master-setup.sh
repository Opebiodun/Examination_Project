#!/bin/bash

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install LAMP stack components
sudo apt install -y apache2 mysql-server php libapache2-mod-php git
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install libapache2-mod-php php php-common php-xml php-mysql php-gd php-mbstring php-tokenizer php-json php-bcmath php-curl php-zip unzip -y

# Enable and start Apache and MySQL services
sudo systemctl enable apache2
sudo systemctl enable mysql
sudo systemctl start apache2
sudo systemctl start mysql

# Install Composer
curl -sS https://getcomposer.org/installer | php

# copy the downloaded binary to the system directory.
sudo mv composer.phar /usr/local/bin/composer
composer --version

# Configure Apache for the application
cat << EOF > /etc/apache2/sites-available/laravel.conf

<VirtualHost *:80>
    ServerAdmin opebiodun@gmail.com
    ServerName 192.168.33.11
    DocumentRoot /var/www/html/laravel/public

    <Directory /var/www/html/laravel>
    Options Indexes MultiViews FollowSymLinks
    AllowOverride All
    Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

sudo a2enmod rewrite
sudo a2ensite laravel.conf

sudo systemctl restart apache2

# Clone the PHP application from GitHub
sudo git clone https://github.com/laravel/laravel.git /var/www/html/laravel
sudo apt-get install git composer -y

sudo composer install --no-dev

# laravel permissions
sudo chown -R www-data:www-data /var/www/html/laravel

sudo chmod -R 775 /var/www/html/laravel

sudo chmod -R 775 /var/www/html/laravel/storage

sudo chmod -R 775 /var/www/html/laravel/bootstrap/cache

sudo cp .env.example .env
sudo php artisan key:generate

# Enable the new site and restart Apache
sudo a2ensite laravel
sudo systemctl restart apache2

#Create a MySQL Database and User
mysql -u root -p 'opebiodun'

CREATE DATABASE laravel;
CREATE USER 'Altschool'@'localhost' IDENTIFIED BY 'opebiodun';
GRANT ALL PRIVILEGES ON laravel.* TO 'Altschool'@'localhost';
FLUSH PRIVILEGES;

cat << EOF > .env
APP_URL=https://laravel.com

DB_CONNECTION=mysql
DB_HOST=192.168.33.11
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=Altschool
DB_PASSWORD=opebiodun
EOF

sudo php artisan config:cache
sudo php artisan migrate

echo "LAMP stack and yourapp deployment completed."
