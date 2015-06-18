#!/usr/bin/env bash
set -e

chmod -x ./inventory

if [[ -z $(xcode-select -p) ]];then
  echo "Info   | Install   | xcode tools"
  xcode-select --install
fi

if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

if [[ ! -x `which pip` ]]; then
    echo "Info   | Install   | pip"
    sudo easy_install pip
fi

if [[ -x `which pip` && ! -x `which ansible` ]]; then
    echo "Info   | Install   | ansible"
    sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
fi

if [[ -x `which ansible` ]]; then
    echo 'Info  | Running Ansible to configure Dev machine'
    ansible-playbook -i inventory site.yaml --ask-sudo-pass
fi
