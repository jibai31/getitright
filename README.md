## README

Project developped during the Startup Weekend 2013.

### Get ready

Download the Vagrant box.

Clone this repository:
```
$ git clone https://github.com/jibai31/swg.git
$ cd swg
```
Make sure the Vagrantfile points to the right box, for instance:
```
config.vm.box_url = "C:\\Users\\your_name\\VagrantBoxes\\rails-bootstrap.box"
```
Start the VM:
```
$ vagrant up
$ vagrant ssh (or connect to the box via PuTTY...)
```
Install the application's dependencies:
```
$ cd /vagrant
$ bundle install
```

### Git setup

```
$ git config --global user.name "Your Name"
$ git config --global user.email your.email@example.com
$ git config --global alias.co checkout
$ git config --global color.ui true
```

### Database setup

Create a DB user called vagrant:
```
$ sudo su postgres -c psql
> CREATE ROLE vagrant SUPERUSER LOGIN;
> \q
```

Create the databases:
```
$ createdb -U vagrant swg_development
$ createdb -U vagrant swg_test
$ createdb -U vagrant swg_production
```

Create the dev DB schema:
```
$ rake db:migrate
```

Apply this schema to your test DB as well:
```
$ rake db:test:prepare
```

You're all set!

### Main commands

Start the Rails server:
```
$ rails s
```

Run the test suite with specifications output:
```
$ rspec spec -fd
```

