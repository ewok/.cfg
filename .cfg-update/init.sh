#!/bin/bash

set -e

if [ "$(whoami)" == "root" ]
then
    pacman -Sy --noconfirm
    pacman -S --needed --noconfirm git sudo

    read -p 'Future used user: ' instuser
    if id -u "$instuser" >/dev/null 2>&1; then
        echo '$instuser exists'
    else
        useradd -m $instuser
        passwd $instuser
    fi

    mkdir -p /etc/sudoers.d
    echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/10-installer
    usermod -aG wheel $instuser
    echo "Now switch to your user(sudo -u $instuser bash)";
    exit 1;
fi

cd $HOME

if [ ! -d $HOME/.cfg ]
then
    git clone --bare https://github.com/ewok/.cfg.git $HOME/.cfg
fi

function config {
   git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

mkdir -p $HOME/.config-backup

config checkout

if [ $? = 0 ]
then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi

config checkout
config config status.showUntrackedFiles no

sudo pacman -S --need --noconfirm python-virtualenv

cd $HOME/.cfg-update
bash install.sh
