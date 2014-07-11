#!/bin/bash
# This script is designed for Ubuntu 12.04
# Should mostly work on 11.10 except Heroku install but not tested
# run with . <filename>.sh

# Get password to be used with sudo commands
# Script still requires password entry during rvm and heroku installs
echo -n "Enter password to be used for sudo commands:"
read -s password

# Function to issue sudo command with password
function sudo-pw {
    echo $password | sudo -S $@
}

# Show commands as they are executed, useful for debugging
# turned off in some areas to avoid logging other scripts
set -v

# Store current stdout and stderr in file descriptors 3 and 4
# If breaking out of script before complete, restart terminal
# to restore proper descriptors
exec 3>&1
exec 4>&2

# Capture all output and errors in config_log.txt for debugging
# in case of errors or failed installs due to network or other issues
exec > >(tee config_log.txt)
exec 2>&1

# Start configuration
cd ~/
sudo-pw apt-get update
sudo-pw apt-get install -y dkms     # For installing VirtualBox guest additions

# remove un-needed packages as recommended by above output
sudo-pw apt-get -y autoremove

# add profile to bash_profile as recommended by rvm
touch ~/.bash_profile
echo "source ~/.profile" >> ~/.bash_profile

# Install RVM and ruby - note: may take a while to compile ruby
sudo-pw apt-get install -y curl
set +v
curl -L https://get.rvm.io | bash -s stable --ruby=2.0.0
source ~/.rvm/scripts/rvm

# reload profile to set paths for gem and rvm commands
source ~/.bash_profile
set -v

# remove warning when having ruby version in Gemfile so Heroku uses correct version
rvm rvmrc warning ignore allGemfiles

# Install db dev
sudo-pw apt-get -y install sqlite3 libsqlite3-dev
sudo-pw apt-get -y install postgresql postgresql-contrib

# Install nodejs
sudo-pw add-apt-repository ppa:chris-lea/node.js
sudo-pw apt-get update
sudo-pw apt-get install -y nodejs

# Install jslint
set +v
cd ~/
curl -LO http://www.javascriptlint.com/download/jsl-0.3.0-src.tar.gz
tar -zxvf jsl-0.3.0-src.tar.gz
cd jsl-0.3.0/src/
make -f Makefile.ref
cd ~/
sudo-pw cp jsl-0.3.0/src/Linux_All_DBG.OBJ/jsl /usr/local/bin
sudo-pw rm jsl-0.3.0-src.tar.gz
sudo-pw rm -rf ~/jsl-0.3.0
set -v

# Install other programs
sudo-pw apt-get install -y git
sudo-pw apt-get install -y chromium-browser
sudo-pw apt-get install -y graphviz
sudo-pw apt-get install -y libpq-dev

# install heroku toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh


## Editors
# Install VIM and add some basic config/plugins
# sudo-pw apt-get install -y vim
# set +v
# echo "filetype on  \" Automatically detect file types." >> .vimrc
# echo "set nocompatible  \" no vi compatibility." >> .vimrc
# echo "" >> .vimrc
# echo "\" Add recently accessed projects menu (project plugin)" >> .vimrc
# echo "set viminfo^=\!" >> .vimrc
# echo "" >> .vimrc
# echo "\" Minibuffer Explorer Settings" >> .vimrc
# echo "let g:miniBufExplMapWindowNavVim = 1" >> .vimrc
# echo "let g:miniBufExplMapWindowNavArrows = 1" >> .vimrc
# echo "let g:miniBufExplMapCTabSwitchBufs = 1" >> .vimrc
# echo "let g:miniBufExplModSelTarget = 1" >> .vimrc
# echo "" >> .vimrc
# echo "\" alt+n or alt+p to navigate between entries in QuickFix" >> .vimrc
# echo "map <silent> <m-p> :cp <cr>" >> .vimrc
# echo "map <silent> <m-n> :cn <cr>" >> .vimrc
# echo "" >> .vimrc
# echo "\" Change which file opens after executing :Rails command" >> .vimrc
# echo "let g:rails_default_file='config/database.yml'" >> .vimrc
# echo "" >> .vimrc
# echo "syntax enable" >> .vimrc
# echo "" >> .vimrc
# echo "set cf  \" Enable error files & error jumping." >> .vimrc
# echo "set clipboard+=unnamed  \" Yanks go on clipboard instead." >> .vimrc
# echo "set history=256  \" Number of things to remember in history." >> .vimrc
# echo "set autowrite  \" Writes on make/shell commands" >> .vimrc
# echo "set ruler  \" Ruler on" >> .vimrc
# echo "set nu  \" Line numbers on" >> .vimrc
# echo "set nowrap  \" Line wrapping off" >> .vimrc
# echo "set timeoutlen=250  \" Time to wait after ESC (default causes an annoying delay)" >> .vimrc
# echo "\" colorscheme vividchalk  \" Uncomment this to set a default theme" >> .vimrc
# echo "" >> .vimrc
# echo "\" Formatting" >> .vimrc
# echo "set ts=2  \" Tabs are 2 spaces" >> .vimrc
# echo "set bs=2  \" Backspace over everything in insert mode" >> .vimrc
# echo "set shiftwidth=2  \" Tabs under smart indent" >> .vimrc
# echo "set nocp incsearch" >> .vimrc
# echo "set cinoptions=:0,p0,t0" >> .vimrc
# echo "set cinwords=if,else,while,do,for,switch,case" >> .vimrc
# echo "set formatoptions=tcqr" >> .vimrc
# echo "set cindent" >> .vimrc
# echo "set autoindent" >> .vimrc
# echo "set smarttab" >> .vimrc
# echo "set expandtab" >> .vimrc
# echo "" >> .vimrc
# echo "\" Visual" >> .vimrc
# echo "set showmatch  \" Show matching brackets." >> .vimrc
# echo "set mat=5  \" Bracket blinking." >> .vimrc
# echo "set list" >> .vimrc
# echo "\" Show $ at end of line and trailing space as ~" >> .vimrc
# echo "set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<" >> .vimrc
# echo "set novisualbell  \" No blinking ." >> .vimrc
# echo "set noerrorbells  \" No noise." >> .vimrc
# echo "set laststatus=2  \" Always show status line." >> .vimrc
# echo "" >> .vimrc
# echo "\" gvim specific" >> .vimrc
# echo "set mousehide  \" Hide mouse after chars typed" >> .vimrc
# echo "set mouse=a  \" Mouse in all modesc" >> .vimrc
# mkdir .vim
# cd .vim
# wget http://www.vim.org/scripts/download_script.php?src_id=16429
# mv d* rails.zip
# unzip rails.zip
# rm -rf rails.zip
# # to allow :help rails, start up vim and type :helptags ~/.vim/doc
# set -v

## GEMS

# install rails 
gem install rails -v 4.1.0

# sqlite 3 gem
gem install sqlite3

# postgres sql gem
gem install pg -v 0.15.1

# other gems: for testing and debugging....
gem install cucumber -v 1.3.8
gem install cucumber-rails -v 1.3.1
gem install cucumber-rails-training-wheels
gem install rspec
gem install rspec-rails
gem install autotest
gem install spork
gem install metric_fu
gem install debugger
gem install timecop -v 0.6.3
gem install chronic -v 0.9.1
# for app development...
gem install omniauth
gem install omniauth-twitter
gem install nokogiri
gem install ruby-graphviz
gem install reek
gem install flog
gem install flay
gem install jquery-rails
gem install fakeweb

# Restore stdout and stderr and close file descriptors 3 and 4
exec 1>&3 3>&-
exec 2>&4 4>&-

# turn off echo
set +v

# NOTE: you will need to run `source /home/vagrant/.rvm/scripts/rvm` or similar (see the output from the script) to have access to your gems etc.
