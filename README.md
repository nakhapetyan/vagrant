Vagrant LAMP server
============

LAMP development stack configuration for Vagrant.

Requirements
-----------

* [VirtualBox](http://www.virtualbox.org/)
* [vagrant](http://vagrantup.com/) >= 1.7.0

Installation
-------------

Download and install [VirtualBox](http://www.virtualbox.org/)

Download and install [vagrant](http://vagrantup.com/)

Clone this repository into your **projects folder** and run vagrant.
	
	$ git clone https://github.com/nakhapetyan/vagrant.git	
    $ cd vagrant
    $ vagrant up

Now go to [http://localhost:8080](http://localhost:8080) or [http://192.168.8.8](http://192.168.8.8) check out your new server with mapped projects. 
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
* mc, vim, curl, pv


Usage
-----
### Start VM

	$ vagrant up

### Stop VM

	$ vagrant halt
	
### Access to VM via ssh
 
	$ vagrant ssh


### Adding virtual hosts

1. Move your project files to `../project_name/www/` directory
2. Add record to **hosts** file `127.0.0.1 project_name`

Your project will be available at [http://project_name:8080](http://project_name:8080) url.	 
 
Example of directory tree 
```shell 
$ ~/PhpstormProjects> tree -L 2
.                       --> mapped to VM:/var/www/  (http://localhost:8080 or http://192.168.8.8)
├── project_name
│   └── www             --> mapped to VM:/var/www/project_name/www  (http://project_name:8080)
├── project_name2
│   └── www             --> mapped to VM:/var/www/project_name2/www  (http://project_name2:8080)
└── vagrant             --> mapped to VM:/vagrant/
    └── Vagrantfile
 
``` 
 

### MySQL

User: **root** Password: *empty string* 
 
Access from VM

	$ mysql -u root
    	
### Import databases

Put your *.sql or *.sql.gz files to **vagrant/databases** folder and run on the VM
    
    $ /vagrant/databases/import_all.sh 


### XDebug

1. Server side settings already configured.
2. Install [browser toolbar](https://confluence.jetbrains.com/display/PhpStorm/Browser+Debugging+Extensions)
3. Click **Listen Debug Connections** button in PHPStorm 
4. Start debug session in browser with the toolbar
![screenshot](https://i.imgur.com/uxQUDIj.png)


### Adding extra software

Just add install commands to **bootstrap.sh** and run vagrant provision. For example install Golang.
    
    $ sudo add-apt-repository -y ppa:gophers/archive
    $ sudo apt update
    $ sudo apt-get install -y golang-1.9-go
    
    On host:
    
    $ vagrant provision 

