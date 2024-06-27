
# Path
set -x fish_user_paths
fish_add_path ~/.local/bin

# ssh
alias ssh "TERM=xterm-256color command ssh"
alias mosh "TERM=xterm-256color command mosh"

# Disable the fish greeting message
set fish_greeting ""

# Setup brew
if type -q brew
    eval "$(brew shellenv)"
end

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
    if status is-interactive
        pyenv init - | source
        pyenv virtualenv-init - | source
    end
end

# Mise
if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end
end

# # Starship
# function starship_transient_prompt_func
#   starship module character
# end
# starship init fish | source
# enable_transience

# Tide Prompt
set --global tide_character_icon '🍆'
set --global tide_cmd_duration_decimals 2
set --global tide_cmd_duration_threshold 0

source ~/.config/fish/abbreviations.fish

# Bootstrap Fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
