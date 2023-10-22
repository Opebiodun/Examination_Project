# Documentation: Automate the provisioning of two Ubuntu-based servers,"Master" and "Slave", using Vagrant and deployment of LAMP Stack and Laravel Application on Ubuntu 

## Introduction

This documentation outlines the steps involved in initializing a Vagrant project using a Bash script. The script creates a directory for the Vagrant project, generates a `Vagrantfile`, and initializes two Ubuntu-based Vagrant boxes. The resulting Vagrant environment includes a 'Master' and 'Slave' box with specified configurations

Also Inncludes the steps and details for automating the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack and a Laravel application on an Ubuntu server. The provided Bash script streamlines the installation and configuration process, making it easier to set up a development environment for Laravel projects.

Note: As you are running the Vagrant-setup.sh code file. it will automatically run the Master_setup.sh code file because the path to the code is already specified in Master Vagrant-setup.sh code

## Prerequisites

Before executing the provided script, ensure the following prerequisites are met:

- VirtualBox Manager Box is installed
- [Vagrant](https://www.vagrantup.com/) is installed on your system.
- A working internet connection for Vagrant to download box images and to download required packages.
- Basic knowledge of working with Vagrant and virtual machines.
- An Ubuntu server with SSH access.
- Basic knowledge of the Linux command line.
- A Laravel application ready for deployment.

## Step-by-Step Deployment

### Step 1: Update and Upgrade Packages

The script initiates by updating the package repository and upgrading installed packages to their latest versions. This ensures that the server is up-to-date with the latest security patches and software updates.

### Step 2: Install LAMP Stack Components

- Apache, the web server component, is installed to serve web pages and applications.
- MySQL is installed to provide the database management system.
- PHP and essential PHP extensions are installed to enable server-side scripting.

### Step 3: Enable and Start Apache and MySQL Services

This step ensures that both Apache and MySQL services are enabled to automatically start when the server boots up. Additionally, these services are started to make them immediately available.

### Step 4: Install Composer

Composer, a PHP dependency manager, is installed. Composer is a vital tool for managing Laravel project dependencies.

### Step 5: Configure Apache for Laravel Application

- A virtual host configuration for the Laravel application is created. This configuration specifies the document root and enables Apache to serve the Laravel application.
- The Apache rewrite module is enabled, enabling URL rewriting for clean URLs.
- The new site configuration is activated, and Apache is restarted to apply the changes.

### Step 6: Clone Laravel Application from GitHub

- The Laravel application is cloned from its GitHub repository into the `/var/www/html/laravel` directory.
- Additional software components like Git and Composer are installed to support the application's deployment and management.

### Step 7: Set Permissions

- Permissions are set to ensure that the web server user has the necessary permissions to read and write files in the Laravel project directories.
- The `.env.example` file is copied to `.env`, and a new application key is generated for security.

### Step 8: Create a MySQL Database and User

- A MySQL database named `laravel` is created to house the Laravel application's data.
- A MySQL user 'Altschool' is created with the password 'opebiodun'. This user is then granted full privileges on the `laravel` database.
- Database access details are added to the Laravel application's `.env` file for seamless connectivity.

### Step 9: Cache Laravel Configuration

The Laravel configuration is cached, improving the application's performance by reducing configuration parsing on each request.

### Step 10: Run Database Migrations

Laravel's database migrations are executed to create the required database tables for the application.

## Conclusion

This Bash script automates the deployment of a LAMP stack and a Laravel application on an Ubuntu server, significantly simplifying the setup process. 

Customization and extension of the script are possible to meet specific deployment requirements. Troubleshooting issues, if encountered, may require reviewing the script's output and checking the Laravel application's configurations.


## Ansible Playbook Documentation: Deploy and Test Laravel Application

## Introduction
This document provides documentation for the Ansible playbook `slave-playbook.yml`. The playbook is designed to automate the deployment of a Laravel application and verify its accessibility through the VM's IP address for slave server. The playbook contains two primary tasks: executing a bash script and checking the application's accessibility.

## Prerequisites
Before using this playbook, make sure you have the following prerequisites in place:

- Ansible installed on your local machine which would be the master server after setup according to the documentation above.
- Access to the target server (Slave node) from master server with SSH(without prompting for password) key-based authentication.
- A Laravel application ready for deployment on the slave server.
- The path to a bash script that performs the necessary deployment steps.

## Usage

To use this playbook, follow these steps:

1. **Edit the Playbook**:
   - Open the `slave-playbook.yml` playbook in a text editor (nano or any other test editor desired).
   
2. **Run the Playbook**:
   Execute the playbook using the following command:
   
   RUN
   ansible-playbook slave-playbook.yml
