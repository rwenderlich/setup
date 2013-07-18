#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
git config --global user.name "Ray Wenderlich"
git config --global user.email ray.wenderlich@gmail.com

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install npm
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
# npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
# sudo apt-add-repository -y ppa:cassou/emacs
# sudo apt-get update
# sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
 
# install heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone git@github.com:rwenderlich/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
ln -sb dotfiles/.tmux.conf .

# git pull and setup homework project
git clone git@github.com:rwenderlich/bitstarter
cd bitstarter
git remote add heroku git@heroku.com:guarded-stream-6230.git 
