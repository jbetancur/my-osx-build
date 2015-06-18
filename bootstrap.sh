#!/usr/bin/env bash
set -e

echo 'Installing Homebrew'
# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install caskroom/cask/brew-cask
    brew tap caskroom/cask
    brew tap caskroom/versions
    brew tap caskroom/homebrew-versions
fi

echo 'Installing Ansible'

# prefer pip for installing python packages over the older easy_install
#
if [[ ! -x `which pip` ]]; then
    sudo easy_install pip
fi

if [[ -x `which pip` && ! -x `which ansible` ]]; then
    sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
fi

echo 'Running Ansible to configure Dev machine'

if [[ -x `which ansible` ]]; then
    ansible-playbook -i hosts main.yaml --ask-sudo-pass
fi

echo 'Installing XCode Tools'

if [[ !-z $(xcode-select -p) ]];then
  xcode-select --install
fi
