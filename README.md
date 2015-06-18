## OSX Environment Build using Ansible
Run and wait...

```
./bootstrap.sh
```

## Known Issues
If you are running this Playbook on a fresh OSX install

* When prompted for Xcode tools installs * it will manual intervention
* You will be prompted several times for sudo credentials as pre*reqisites are being installed


## Inventory

### Pre Requisites (installed by bootstrap.sh)

* xcode-select (xcode tools)
* pip
* ansible
* homebrew (taps and cask)

### common

* java7
* xquartz

### Libraries

* git
* curl
* wget
* ssh*copy*id
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
* atom
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
