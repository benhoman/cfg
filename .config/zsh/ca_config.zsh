export CA_REPOS=$HOME/src/github.com/bhoman-ca
alias export_sshkey='export SSHKEY=$(<~/.ssh/id_rsa)'
alias export_known_hosts='export KNOWN_HOSTS=$(ssh-keyscan github.com 2>/dev/null)'
alias export_npm_token='export NPM_TOKEN=$(grep "_authToken" ~/.config/consumeraffairs/npmrc | cut -d"=" -f2)'
alias export_cavars='export_sshkey && export_known_hosts && export_npm_token'
alias copy_git_hooks='cp $CA_REPOS/ca-git-hooks/* $(git root)/.git/hooks'
# alias cabuild='SSHKEY=`cat ~/.ssh/id_rsa` NPM_TOKEN=`cat ~/.npmrc | grep ":_authToken=" | cut -d "=" -f2` KNOWN_HOSTS=`cat ~/.ssh/known_hosts` docker-compose build'
alias cabuild='SSHKEY=`cat ~/.ssh/id_rsa` NPM_TOKEN=`cat ~/.npmrc | grep ":_authToken=" | cut -d "=" -f2` KNOWN_HOSTS=`ssh-keyscan github.com 2>/dev/null` docker-compose build'
alias cabob="./node_modules/.bin/cabob"
alias cagit="GIT_SSH_COMMAND='ssh -i ~/.ssh/ca_id_rsa -F /dev/null' git"

# Docker-compose v1 compatibility
export COMPOSE_COMPATIBILITY=true

function cacd () {
    cd "$CA_REPOS/$1"
}

function jira () {
  xdg-open "https://consumeraffairs.atlassian.net/browse/${1}-${2}"
}
function twingate_auth () {
    xdg-open "$(twingate status | grep -Eo "https://[^ >]+" | head -n1)"
}
function pdq () { jira "PDQ" "$1" }
function pdw () { jira "PDW" "$1" }
