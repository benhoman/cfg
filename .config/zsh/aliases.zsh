# General
alias sudo="sudo "
alias e="nvim"
# alias vim="nvim"

# Kitty
if command -v kitty 2>&1 >/dev/null && [[ "$TERM" == "xterm-kitty" ]]; then
    alias ssh="kitty +kitten ssh"
    alias icat="kitty +kitten icat"
    # alias ssh="TERM='xterm-256color' ssh"
fi

# Misc
alias nf="neofetch"
alias _="cd $(mktemp -d) ; "
alias rm="rm -i"

# Linux/OSX copy/paste
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias dots='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# exa
if command -v exa 2>&1 >/dev/null; then
  alias ls="exa --color=auto"
  alias ll="exa --color=auto --icons -lah"
  alias lg="exa --color=auto --icons --grid -lah"
  alias la="exa --color=auto --icons -a"
fi

alias lgrep="ls -lha | grep"

# bat - cat replacement
if command -v batcat 2>&1 >/dev/null; then
  alias cat="batcat"
elif command -v bat 2>&1 >/dev/null; then
  alias cat="bat"
fi

# colordiff
if command -v colordiff 2>&1 >/dev/null; then
  alias diff="colordiff"
fi

# tmux
alias ta="tmux attach"

# cd Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Docker
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcp="docker-compose pull"

# Django
alias django_secret_key='python -c "import secrets; print(secrets.token_urlsafe())"'

# Copy with progress bar
alias cpv='rsync -ah --info=progress2'

# Cd to root of git project
alias cg='cd `git rev-parse --show-toplevel`'

# Count files in directory
alias count='find . -type f | wc -l'
alias counttop='find . -maxdepth 1 -type f | wc -l'

# Python Virtual Environments
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

# SimpleHTTPServer
alias servethis="python3 -m http.server"

# Pacman
# alias pacnew='rg pacnew /var/log/pacman.log'
alias pacnew='fd .pacnew /etc'

# Python
alias pyclean='sudo find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete'
alias bdc='black --diff --color'
alias pip-dep='pip --use-deprecated=legacy-resolver'

# Git
alias g='git'
alias ga='git add'
alias gc='git checkout'
alias gm='git commit'
alias gs='git status'
alias gpuq='git pull upstream qa'
alias gcob='git branch | fzf | xargs git checkout'
alias gdnew="for next in \$( git ls-files --others --exclude-standard ) ; do git --no-pager diff --no-index /dev/null \$next; done;"
alias gdall="git --no-pager diff; gdnew"

# Pyenv
alias da="pyenv deactivate"

# Ansible
alias ansible='podman run -v "${PWD}":/work:ro --rm spy86/ansible:latest'
alias ansible-playbook='podman run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles -v ~/.ssh:/root/.ssh:ro --rm spy86/ansible:latest ansible-playbook'
alias ansible-vault='podman run -v "${PWD}":/work:ro --rm spy86/ansible:latest ansible-vault'

# Containers
alias rustscan='podman run -it --rm --name rustscan rustscan/rustscan'
alias onefetch='podman run --rm -it --name onefetch -v ${PWD}:/data:z onefetch'

# Kubernetes
alias k="kubectl"
