  #!/usr/bin/env bash

  # Author: John Betancur
  # Distribute freely

  set -e

  SUPPORTED_OSX_VERSION=10
  ACTUAL_OSX_VERSION=$(sw_vers -productVersion | awk -F "." '{print $2}')

  if [ "$ACTUAL_OSX_VERSION" -lt "$SUPPORTED_OSX_VERSION" ]; then
    echo "You are running OSX version $ACTUAL_OSX_VERSION. You must be running OSX version $SUPPORTED_OSX_VERSION or higher"
    exit 1
  fi

  if [[ -z $(xcode-select -p) ]];then
    echo "Info   | Install   | xcode tools"
    xcode-select --install
    # Not fool proof - in case xcode tools installer is slow to start
    sleep 15
    xtoolsPid=`ps aux | awk '/[I]nstall Command Line Developer Tools.app/ {print $2}'`
    while (ps -p $xtoolsPid > /dev/null)
      do sleep 1
    done
  fi

  if [[ -z $(xcode-select -p) ]];then
    echo Installation Cancelled - cannot proceed without xcode-select
    exit 1;
  fi

  if [[ ! -x `which pip` ]]; then
      echo "Info   | Install   | pip"
      sudo easy_install pip
  fi

  if [[ -x `which pip` && ! -x `which ansible` ]]; then
      echo "Info   | Install   | ansible"
      sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
  fi

  if [[ ! -x /usr/local/bin/brew ]]; then
      echo "Info   | Install   | homebrew"
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
      brew update
  fi

  if [[ -x `which ansible` ]]; then
      echo 'Info  | Running Ansible to configure Dev machine'
      chmod -x ./inventory
      ansible-playbook -i inventory site.yaml --ask-sudo-pass
  fi
