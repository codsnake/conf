export PATH=$PATH:/opt/activator
export PATH=$PATH:/opt/node-v4.4.0-linux-x64

alias reloadsh='source ~/.bash_profile'

# Insert on the .bash_profile (MAC OS X) or .bashrc (some UNIX distos)

function proml {
  # Attribute{codes:
  # 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
  # Text color codes:
  # 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
  # Background color codes:
  # 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
  # \[\e[01;36m\]

  RESET="\[\017\]"
  NORMAL="\[\033[0m\]"
  RED="\[\033[0;31m\]"
  YELLOW="\[\033[1;33m\]"
  WHITE="\[\033[0;37m\]"
  GREEN="\[\033[1;32m\]"
  BLUE="\[\033[1;34m\]"
  CYAN="\[\033[0;36m\]"
  MAGENTA="\[\033[0;45m\]"

  function git_branches {
    git branch 2> /dev/null | sed -r 's/^\* (.+)/(\1)/g' | sed -r ':began N ; s/\n|\s{2,}/ /g ;b began '
  }
  function git_current_branch {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
  }
  function rvm_prompt {
    ~/.rvm/bin/rvm-prompt i v g
  }

  PS1="${GREEN}\u ${CYAN}\w ${YELLOW}git:\`git_current_branch\` ${NORMAL}\n$ "
  export PS1
}

proml
umask 002
