Vagrant LAMP
============

LAMP development stack configuration for Vagrant.

Requrements
-----------

* [VirtualBox](http://www.virtualbox.org/)
* [vagrant](http://vagrantup.com/) >= 1.7.0

Installation:
-------------

Download and install [VirtualBox](http://www.virtualbox.org/)

Download and install [vagrant](http://vagrantup.com/)

Clone this repository to your projects folder and run vagrant.
	
	$ git clone https://github.com/nakhapetyan/vagrant.git	
    $ cd vagrant
    $ vagrant up

Now go to [http://localhost:8080](http://localhost:8080) check out your new server. 
![screenshot](https://i.imgur.com/bZmei51.png)


What's inside:
--------------

* Ubuntu 16.04.3 LTS (Xenial Xerus)
* Apache 2
* MySQL 5.7
* PHP 7
* Xdebug
* Lua 5.2
* Python
* Memcached
* Redis
* git, svn
* mc, vim, screen, tmux, curl, pv


Usage
-----
### Start VM

	vagrant up

### Stop VM

	vagrant halt
	
### Access to VM via ssh
 
	vagrant ssh


### Add virtual hosts

1. Move your project files to `../project_name/www/` 
2. Add record to *hosts* file `127.0.0.1 project_name`

Your project will be available at [http://project_name:8080](http://project_name:8080) url.	 
 
Example of directory tree 
```shell 
$ ~/PhpstormProjects> tree -L 2
.                       --> mapped to VM:/var/www/
├── project_name
│   └── www
├── project_name2
│   └── www
└── vagrant             --> mapped to VM:/vagrant/
    └── Vagrantfile
 
``` 
 

### Synced folders

Host            | VM
----------------|----------------------
vagrant/.       | /vagrunt
vagrant/..      | /var/www


### MySQL
 
Access from VM

	mysql -u root
	
Access from host
		
	mysql -u root -P 33066 


### XDebug

PHPStorm [configuration](https://www.sitepoint.com/install-xdebug-phpstorm-vagrant/)


