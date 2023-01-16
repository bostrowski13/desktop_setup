#!/bin/bash

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\$(parse_git_branch) \[\033[m\]\[\033[33;1m\]\w\[\033[m\]\> "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ll='ls -lsa'

#PROMPT='%B%1~ #>'

function image_compare () {
    container-diff diff $1 $2 \
    --type=file \
    --type=size \
    --type=apt \
    --json
}

function usagesort {
  local dir_to_list="$1"
  cd "$dir_to_list"
  du -h -d 1 | sort -k 1,1 -g
}

alias tfi='/usr/local/opt/terraform/bin/terraform init'
alias tfp='/usr/local/opt/terraform/bin/terraform plan'
alias tfa='/usr/local/opt/terraform/bin/terraform apply --auto-approve'
alias tfd='/usr/local/opt/terraform/bin/terraform destroy --auto-approve'
alias tff='/usr/local/opt/terraform/bin/terraform fmt'
alias tfv='/usr/local/opt/terraform/bin/terraform validate'
