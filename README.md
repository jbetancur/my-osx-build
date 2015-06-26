## OSX Environment Build using Ansible
Run:

```
./bootstrap.sh
```

## Known Issues
If you are running this Playbook on a fresh OSX install

* When prompted for Xcode tools installs - it will require manual intervention
* You will be prompted several times for sudo credentials as pre-reqisites are being installed

## TODO

* add specific application configurations

## Inventory

### Pre Requisites (installed by ./bootstrap.sh)

* xcode-select (xcode tools)
* pip
* ansible
* homebrew (taps and cask)

### profile
Modify ~/.bash_profile with goodies
* highlghting
* aliases
* git branching

### common

* java7
* xquartz
* gems
  * sass
  * scss-lint
### Libraries

* git
* curl
* wget
* ssh-copy-id
* vim
* maven
* ant
* tree
* watch
* colordiff
* packer

### Productivity Applications

* google-chrome
* virtualbox
* microsoft-office
* firefox
* google-hangouts
* google-drive
* vlc
* hipchat
* flowdock
* unrarx
* alfred
* flash-player
* vmware-fusion

### Developer tools

* sublime-text3
* atom + packages
  * esformatter
  * linter
  * linter-eslint
  * linter-scss-lint
  * floobits
  * seti-ui
* eclipse-java
* postgres
* boot2docker
* vagrant
* vagrant-manager
* sourcetree
* cyberduck
* python
* go
* wireshark
* mou
* github
* iterm2

### NodeJS Environment & NPM Apps

* node
* esformatter
* eslint
* gulp
* yo
* babel
* vtop
* node-debug
* grunt-cli
* jspm
* karma-cli
* webpack
