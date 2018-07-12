# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export GOPATH=/cloudtrust/go
export PATH=$GOPATH/bin:$PATH
# User specific aliases and functions
alias vim=nvim
bind 'set show-all-if-ambiguous on'
shopt -s histappend
PROMPT_COMMAND='history -a;history -n'
