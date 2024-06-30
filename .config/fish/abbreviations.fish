if type -q eza
    abbr --add l "eza -l --icons --git -a --color=auto"
    abbr --add ls "eza --color=auto"
    abbr --add ll "eza --color=auto --icons -lah"
    abbr --add lg "eza --color=auto --icons --grid -lah"
    abbr --add la "eza --color=auto --icons -a"
else
    abbr --add ls "ls --color"
end

abbr --add lgrep "ls -lha | grep"

if type -q batcat
    abbr --add cat batcat
else if type -q bat
    abbr --add cat bat
end

# Docker
abbr --add dc "docker compose"
abbr --add dcu "docker compose up"
abbr --add dcd "docker compose down"
abbr --add dcp "docker compose pull"

# Python
abbr --add pyclean 'sudo find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete'
abbr --add bdc 'black --diff --color'
abbr --add pip-dep 'pip --use-deprecated=legacy-resolver'

# Git
abbr --add g git
abbr --add ga 'git add'
abbr --add gc 'git checkout'
abbr --add gm 'git commit'
abbr --add gs 'git status'
abbr --add gpuq 'git pull upstream qa'
abbr --add gpus 'git pull upstream staging'
abbr --add gcob 'git branch | fzf | xargs git checkout'
# abbr --add gdnew "for next in \$( git ls-files --others --exclude-standard ) ; do git --no-pager diff --no-index /dev/null \$next; done;"
abbr --add gdall "git --no-pager diff; gdnew"
