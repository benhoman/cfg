function pssh () {
  podman run --rm -it -v $HOME/.ssh:/root/.ssh:z bhoman/ssh ssh "$@"
}

function mkcd () { mkdir -p "$1" && cd "$1" }
function cl () { cd "$@" && l; }

function rgfzf () {
  # ripgrep
  if [ ! "$#" -gt 0 ]; then
    echo "Usage: rgfzf <query>"
    return 1
  fi
  rg --files-with-matches --no-messages "$1" | \
    fzf --prompt "$1 > " \
    --reverse --multi --preview "rg --ignore-case --pretty --context 10 '$1' {}"
  }

function socks_proxy () {
  podman run --rm -it \
    -v $HOME/.ssh:/root/.ssh:z \
    -p 127.0.0.1:8787:8787 \
    bhoman/ssh ssh jumpbox.proxy
  }

function socks_proxy_home () {
  podman run --rm -it \
    -v $HOME/.ssh:/root/.ssh:z \
    -p 127.0.0.1:8989:8989 \
    bhoman/ssh ssh home.proxy
  }

# Tmux attach with fzf
function ta () {
  if [ $# -eq 0 ]; then
    tmux list-sessions | sed -E 's/:.*$//' | fzf | xargs tmux attach -t
  else
    tmux attach -t "$1"
  fi
}

function tb () {
  if [ $# -eq 0 ]; then
    toolbox enter
  else
    toolbox "$@"
  fi
}

function num_args () {
  echo "$#"
}

function python_throwaway () {
  THROWAWAY_DIR=$(mktemp -d -t virtualenv-XXXXXXX)
  cd $THROWAWAY_DIR
  python3 -m venv .
  source bin/activate
  # trap "rm -r $THROWAWAY_DIR" EXIT
}

function get_latest_github_release () {
  curl --silent -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$1/releases/latest | grep '"tag_name":' | cut -d'"' -f4
}

function fpwd () {
  pwd | sed -e "s|^$HOME|~|" -e 's-\([^/.]\)[^/]*/-\1/-g'
}

# Use Git’s colored diff when available
if hash git &>/dev/null ; then
  function diff () {
    git diff --no-index --color-words "$@"
  }
fi

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
json() {
  if [ -t 0 ]; then # argument
    python -mjson.tool <<< "$*" | pygmentize -l javascript
  else # pipe
    python -mjson.tool | pygmentize -l javascript
  fi
}

fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

# Call from a local repo to open the repository on github/bitbucket in browser
# Modified version of https://github.com/zeke/ghwd
repo() {
	# Figure out github repo base URL
	local base_url
	base_url=$(git config --get remote.origin.url)
	base_url=${base_url%\.git} # remove .git from end of string

	# Fix git@github.com: URLs
	base_url=${base_url//git@github\.com:/https:\/\/github\.com\/}

	# Fix git://github.com URLS
	base_url=${base_url//git:\/\/github\.com/https:\/\/github\.com\/}

	# Fix git@bitbucket.org: URLs
	base_url=${base_url//git@bitbucket.org:/https:\/\/bitbucket\.org\/}

	# Fix git@gitlab.com: URLs
	base_url=${base_url//git@gitlab\.com:/https:\/\/gitlab\.com\/}

	# Validate that this folder is a git folder
	if ! git branch 2>/dev/null 1>&2 ; then
		echo "Not a git repo!"
		exit $?
	fi

	# Find current directory relative to .git parent
	full_path=$(pwd)
	git_base_path=$(cd "./$(git rev-parse --show-cdup)" || exit 1; pwd)
	relative_path=${full_path#$git_base_path} # remove leading git_base_path from working directory

	# If filename argument is present, append it
	if [ "$1" ]; then
		relative_path="$relative_path/$1"
	fi

	# Figure out current git branch
	# git_where=$(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
	git_where=$(command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null

	# Remove cruft from branchname
	branch=${git_where#refs\/heads\/}
	branch=${branch#remotes\/origin\/}

	[[ $base_url == *bitbucket* ]] && tree="src" || tree="tree"
	url="$base_url/$tree/$branch$relative_path"


	echo "Calling $(type open) for $url"

	xdg-open "$url" &> /dev/null || (echo "Using $(type open) to open URL failed." && exit 1);
}

# check if uri is up
isup() {
	local uri=$1

	if curl -s --head  --request GET "$uri" | grep "200 OK" > /dev/null ; then
		notify-send --urgency=critical "$uri is down"
	else
		notify-send --urgency=low "$uri is up"
	fi
}

in_tmux () {
  if [ -n "$TMUX" ]; then
    return 0
  else
    return 1
  fi
}
